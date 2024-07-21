import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'WalletPage/WalletProvider.dart';
import 'WalletPage/WalletPage.dart';
import 'WalletPage/GenerateMnemonic.dart'; 
import 'WalletPage/VerifyMnemonic.dart'; 
import 'WalletPage/CreateOrImport.dart';
import 'WalletPage/LoginPage.dart';
import 'LandingPage/LandingPage.dart';
import 'AssistantPage/AssistantPage.dart';
import 'Market/Market.dart';
import 'AboutPage/AboutPage.dart' as about_page;


// Binfin8 Flutter APplication Showcase ALL RIGHTS RESERVED

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WalletProvider walletProvider = WalletProvider();
  await walletProvider.loadPrivateKey();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletProvider()),
      ],
      child: Binfin8App(),
    ),
  );
}

class Binfin8App extends StatelessWidget {
  const Binfin8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binfin8',
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/assistant': (context) => const AssistantPage(),
        '/wallet': (context) => WalletPage(),
        '/login': (context) => LoginPage(),
        '/market': (context) => MarketPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/Binfin8logo.png',
              height: 50.0, // Adjust height as needed
            ),
            const SizedBox(width: 10.0), // Space between logo and navbar items
            Spacer(), // Takes up all available space, pushing the buttons to the right
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Home', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/assistant');
              },
              child: const Text('AI Assistant', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
              },
              child: const Text('News', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/market');
              },
              child: const Text('Market', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wallet');
              },
              child: const Text('Wallet', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about'); // Updated About Page link
              },
              child: const Text('About', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Text(
                  "Log in",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(34, 72, 62, 1),
        ),
        child: Column(
          children: <Widget>[
            Expanded(child: Landingpage()), // Adjusting LandingPage to take available space
          ],
        ),
      ),
    );
  }
}