// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({super.key});

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Sobre'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.question_mark_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Projeto Prático - B1 - FATEC RP\n\nAplicativo para auxiliar com suas compras no seu dia a dia!\n\nDesenvolvido por: Rodrigo de Almeida Barreira Junior RA: 2840482413032'),
          ],
        ),
      ),
    );
  }
}
