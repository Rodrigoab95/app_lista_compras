// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/item.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Item> items = [];

  void addItem(String name, int quantidade) {
    setState(() {
      items.add(Item(name: name, quantidade: quantidade));
    });
  }

  void toggleItem(Item item) {
    setState(() {
      item.isPurchased = !item.isPurchased;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Lista de Compras'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.question_mark_rounded),
            onPressed: () {
              Navigator.pushNamed(context, 'sobre');
            },
          ),
        ],
      ),
      // body: ListView,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
