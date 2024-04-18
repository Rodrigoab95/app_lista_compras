class Item {
  //Atributos
  String nome;
  int quantidade;
  bool isPurchased;

  //Construtor
  Item({
    required this.nome,
    this.quantidade = 1,
    this.isPurchased = false,
  });
}
