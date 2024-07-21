import 'package:flutter/material.dart';
import 'package:binfin8app/WalletPage/WalletProvider.dart';
import 'package:binfin8app/WalletPage/GenerateMnemonic.dart';
import 'package:provider/provider.dart';


class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateMnemonicPage()), // Ensure this is correctly referenced
                );
              },
              child: const Text('Generate Mnemonic'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add code for importing wallet or other actions here
              },
              child: const Text('Import Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}