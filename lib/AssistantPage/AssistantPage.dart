import 'package:binfin8app/consts.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:binfin8app/CustomAppBar/CustomAppBar.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser_ = ChatUser(id: '1', firstName: 'user', lastName: 'null');
  final ChatUser gptChatUser = ChatUser(id: '2', firstName: 'Chat', lastName: 'GPT');

  List<ChatMessage> _messages_ = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  final FocusNode _focusNode = FocusNode();
  final List<int> _keyTimes = [];
  // Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our AI bot designated to help you, ask any questions.',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _isListening ? stopListening() : startListening();
            },
            child: Text(_isListening ? 'Stop' : 'Speech to text'),
          ),
          Expanded(
            child: RawKeyboardListener(
              focusNode: _focusNode,
              onKey: (event) {
                if (event is RawKeyDownEvent) {
                  _keyTimes.add(DateTime.now().millisecondsSinceEpoch);
                }
              },
              child: DashChat(
                currentUser: _currentUser_,
                typingUsers: _typingUsers,
                messageOptions: const MessageOptions(
                  currentUserContainerColor: Colors.black,
                  containerColor: Colors.green,
                  textColor: Colors.white,
                ),
                onSend: (ChatMessage m) {
                  analyzeTypingPattern();
                  getChatResponse(m);
                },
                messages: _messages_,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(onResult: (val) {
        setState(() => _text = val.recognizedWords);
        if (val.finalResult) {
          stopListening();
          sendTextAsMessage(_text);
        }
      });
    }
  }

  void stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void sendTextAsMessage(String text) {
    ChatMessage message = ChatMessage(
      user: _currentUser_,
      text: text,
      createdAt: DateTime.now(),
    );
    setState(() {
      _messages_.insert(0, message);
    });
    getChatResponse(message);
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages_.insert(0, m);
      _typingUsers.add(gptChatUser);
    });

    List<Map<String, dynamic>> _messagesHistory = _messages_.reversed.map((m) {
      if (m.user == _currentUser_) {
        return {'role': 'user', 'content': m.text};
      } else {
        return {'role': 'assistant', 'content': m.text};
      }
    }).toList();

    final request = ChatCompleteText(
      model: Gpt40314ChatModel(), // Using the free-tier model
      messages: _messagesHistory,
      maxToken: 200,
    );

    final response = await _openAI.onChatCompletion(request: request);

    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages_.insert(
            0,
            ChatMessage(
              user: gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        });
      }
    }
    setState(() {
      _typingUsers.remove(gptChatUser);
    });
  }

  void analyzeTypingPattern() {
    if (_keyTimes.length < 2) return;

    List<int> intervals = [];
    for (int i = 1; i < _keyTimes.length; i++) {
      intervals.add(_keyTimes[i] - _keyTimes[i - 1]);
    }

    // Here you can send intervals to a server or use it for further analysis
    print('Typing intervals: $intervals');

    _keyTimes.clear(); // Clear the list for next input
  }
}