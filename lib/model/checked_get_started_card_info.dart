class CheckedCard extends Object {
  CheckedCard({
    required this.id,
    required this.isChecked,
  });

  final int id;
  final bool isChecked;

  @override
  bool operator ==(Object other) {
    return other is CheckedCard && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
