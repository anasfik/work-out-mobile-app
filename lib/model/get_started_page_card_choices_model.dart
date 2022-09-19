

class ChoiceCard {
  ChoiceCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  factory ChoiceCard.fromJson(jsonString) {
    return ChoiceCard(
      title: jsonString["title"],
      description: jsonString["description"],
    );
  }
}


