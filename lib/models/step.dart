class Step {
  final String id;
  final int number;
  final String description;
  final int points;
  final bool achieved;

  Step({
    this.id,
    this.number,
    this.description,
    this.points,
    this.achieved,
  });

  factory Step.fromMap(Map data) {
    return Step(
      id: data['id'] ?? '',
      number: data['number'] ?? '',
      description: data['description'] ?? '',
      points: data['points'] ?? 0,
      achieved: data['achieved'] ?? false,
    );
  }
}
