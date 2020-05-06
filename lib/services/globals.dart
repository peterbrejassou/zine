import 'package:zine/models/_models.dart';
import 'package:zine/services/_services.dart';

class Globals {
  // Data Models
  static final Map models = {
    Article: (data) => Article.fromMap(data),
    Defi: (data) => Defi.fromMap(data),
  };

  // Firestore References for Writes
  static final Collection<Article> articelsRef =
      Collection<Article>(path: 'articles');
  static final Collection<Defi> defisRef = Collection<Defi>(path: 'defis');
}
