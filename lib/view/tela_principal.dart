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

  void addItem(String nome, int quantidade) {
    setState(() {
      items.add(Item(nome: nome, quantidade: quantidade));
    });
  }

  void toggleItem(Item item) {
    setState(() {
      item.isPurchased = !item.isPurchased;
    });
  }

  void editItem(Item item, String novoNome, int novaQuantidade) {
    setState(() {
      item.nome = novoNome;
      item.quantidade = novaQuantidade;
    });
  }

  void removeItem(Item item) {
    setState(() {
      items.remove(item);
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text('${item.nome} (${item.quantidade})'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    value: item.isPurchased,
                    onChanged: (bool? value) {
                      setState(() {
                        item.isPurchased = value!;
                      });
                    }),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String novoNome = item.nome;
                        int novaQuantidade = item.quantidade;
                        return AlertDialog(
                          title: Text('Editar item'),
                          content: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  novoNome = value;
                                },
                                decoration: InputDecoration(labelText: 'Nome'),
                              ),
                              TextField(
                                onChanged: (value) {
                                  novaQuantidade = int.tryParse(value) ?? 1;
                                },
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: 'Quantidade'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                editItem(item, novoNome, novaQuantidade);
                                Navigator.pop(context);
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeItem(item),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newItemName = '';
              int newItemQuantity = 1;
              return AlertDialog(
                title: Text('Novo Item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        newItemName = value;
                      },
                      decoration: InputDecoration(labelText: 'Nome do Item'),
                    ),
                    TextField(
                      onChanged: (value) {
                        newItemQuantity = int.tryParse(value) ?? 1;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Quantidade'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addItem(newItemName, newItemQuantity);
                      Navigator.pop(context);
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
