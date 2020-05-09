class Step {
  final int number;
  final String description;
  final int points;
  final bool achieved;

  Step({
    this.number,
    this.description,
    this.points,
    this.achieved,
  });

  factory Step.fromMap(Map data) {
    return Step(
      number: data['number'] ?? '',
      description: data['description'] ?? '',
      points: data['points'] ?? 0,
      achieved: data['achieved'] ?? false,
    );
  }
}
