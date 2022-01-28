class Fruit {
  final int id;
  final String name;
  final int value;

  Fruit(
    this.id,
    this.name,
    this.value,
  );

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, value: $value}';
  }
}
