import 'package:zine/services/_services.dart';

// Global State
class Global {
  // App Data
  static final String title = 'Zine';

  // Data Models
  static final Map models = {
    Category: (data) => Category.fromMap(data),
    Defi: (data) => Defi.fromMap(data),
    Step: (data) => Step.fromMap(data),
  };

  // Firestore References for Writes
  static final Collection<Category> categoriesRef =
      Collection<Category>(path: 'categories');
}
