class StepDefi {
  final int number;
  final String description;
  final int points;
  final bool achieved;

  StepDefi({
    this.number,
    this.description,
    this.points,
    this.achieved,
  });

  factory StepDefi.fromMap(Map data) {
    return StepDefi(
      number: data['number'] ?? null,
      description: data['description'] ?? '',
      points: data['points'] ?? 0,
      achieved: data['achieved'] ?? false,
    );
  }

  toMap(StepDefi step) {
    return {
      'number': step.number ?? null,
      'description': step.description ?? '',
      'points': step.points ?? 0,
      'achieved': step.achieved ?? false,
    };
  }
}
