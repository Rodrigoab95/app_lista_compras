class Item {
  //Atributos
  final String name;
  int quantidade;
  bool isPurchased;

  //Construtor
  Item({
    required this.name,
    this.quantidade = 1,
    this.isPurchased = false,
  });
}
