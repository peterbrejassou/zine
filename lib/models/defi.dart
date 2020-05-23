import 'package:zine/models/StepDefi.dart';

class Defi {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<StepDefi> steps;
  final List<dynamic> users;

  Defi({
    this.id,
    this.title,
    this.description,
    this.category,
    this.steps,
    this.users,
  });

  factory Defi.fromMap(Map data) {
    return Defi(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? 'Aucune catégorie',
      steps: (data['steps'] as List ?? [])
          .map((like) => StepDefi.fromMap(like))
          .toList(),
      users: (data['users'] as List ?? []).map((user) => user).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> stepsMap = {};
    this.steps.forEach((step) {
      stepsMap.putIfAbsent(step.number.toString(), () => step.toMap(step));
    });
    return {
      'id': this.id ?? '',
      'title': this.title ?? '',
      'description': this.description ?? '',
      'category': this.category ?? '',
      'steps': stepsMap
    };
  }
}
