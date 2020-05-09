import 'package:zine/models/step.dart';

class Defi {
  final String id;
  final String title;
  final String description;
  final String category;
  final int nbParticipants;
  final List<Step> steps;

  Defi({
    this.id,
    this.title,
    this.description,
    this.category,
    this.nbParticipants,
    this.steps,
  });

  factory Defi.fromMap(Map data) {
    return Defi(
        id: data['id'] ?? '',
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        category: data['category'] ?? 'Aucune catégorie',
        nbParticipants: data['nbParticipants'] ?? 0,
        steps:
            (data['steps'] as List ?? []).map((v) => Step.fromMap(v)).toList());
  }
}
