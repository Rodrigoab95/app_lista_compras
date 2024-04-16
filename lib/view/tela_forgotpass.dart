// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaForgotPass extends StatefulWidget {
  const TelaForgotPass({super.key});

  @override
  State<TelaForgotPass> createState() => _TelaForgotPassState();
}

class _TelaForgotPassState extends State<TelaForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite o seu email',
                labelStyle: TextStyle(fontSize: 18),
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Senha encaminhada por email com sucesso!'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('Recuperar senha'),
            ),
          ],
        ),
      ),
    );
  }
}
