class ChoiceCard {
  ChoiceCard({
    required this.title,
    required this.description,
    required this.id,
  }) {
    idCounter++;
  }
  static int idCounter = 0;
  final String title;
  final String description;
  final int id;

  factory ChoiceCard.fromJson(jsonString) {
    return ChoiceCard(
      title: jsonString["title"],
      description: jsonString["description"],
      id: idCounter,
    );
  }
}
