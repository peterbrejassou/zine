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
      number: data['number'] ?? null,
      description: data['description'] ?? '',
      points: data['points'] ?? 0,
      achieved: data['achieved'] ?? false,
    );
  }

  toMap(Step step) {
    return {
      'number': step.number ?? null,
      'description': step.description ?? '',
      'points': step.points ?? 0,
      'achieved': step.achieved ?? false,
    };
  }
}
