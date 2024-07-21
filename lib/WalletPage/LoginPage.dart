import 'package:flutter/material.dart';
import 'package:binfin8app/WalletPage/WalletProvider.dart';
import 'package:provider/provider.dart';
import 'package:binfin8app/WalletPage/WalletPage.dart';
import 'package:binfin8app/WalletPage/CreateOrImport.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      return CreateOrImportPage();
    } else {
      return WalletPage();
    }
  }
}