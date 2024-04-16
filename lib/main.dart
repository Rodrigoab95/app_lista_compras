// ignore_for_file: prefer_const_constructors
import 'package:app_lista_compras/view/tela_forgotpass.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/tela_login.dart';
import 'view/tela_cadastro.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      //
      // ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 'login',
      routes: {
        'login': (context) => TelaLogin(),
        'cadastro': (context) => TelaCadastro(),
        'forgotpass': (context) => TelaForgotPass(),
      },
    );
  }
}
