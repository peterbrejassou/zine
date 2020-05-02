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
        number: data['number'] ?? 1,
        description: data['description'] ?? '',
        points: data['points'] ?? 0,
        achieved: data['achieved'] ?? false);
  }
}

class Defi {
  final String id;
  final String title;
  final String description;
  final int nbParticipants;
  final List<Step> steps;

  Defi({
    this.id,
    this.title,
    this.description,
    this.nbParticipants,
    this.steps,
  });

  factory Defi.fromMap(Map data) {
    return Defi(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      nbParticipants: data['nbParticipants'] ?? 0,
      steps: (data['steps'] as List ?? [])
          .map((v) => Step.fromMap(v))
          .toList(), //data['steps'],
    );
  }
}

class Category {
  final String id;
  final String title;
  final String icon;
  final String color;
  final List<Defi> defis;

  Category({this.id, this.title, this.icon, this.color, this.defis});

  factory Category.fromMap(Map data) {
    return Category(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      icon: data['icon'] ?? '',
      color: data['color'] ?? 'greenZine',
      defis: (data['defis'] as List ?? [])
          .map((v) => Defi.fromMap(v))
          .toList(), //data['defis'],
    );
  }
}
