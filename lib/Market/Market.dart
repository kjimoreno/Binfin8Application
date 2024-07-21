import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Future<Map<String, dynamic>> _cryptoData;

  @override
  void initState() {
    super.initState();
    _cryptoData = fetchCryptoPrices();
  }

  Future<Map<String, dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,litecoin&vs_currencies=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Market'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _cryptoData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return ListView(
              children: [
                ListTile(
                  title: const Text('Bitcoin'),
                  subtitle: Text('Price: \$${data['bitcoin']['usd']}'),
                ),
                ListTile(
                  title: const Text('Ethereum'),
                  subtitle: Text('Price: \$${data['ethereum']['usd']}'),
                ),
                ListTile(
                  title: const Text('Litecoin'),
                  subtitle: Text('Price: \$${data['litecoin']['usd']}'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}