import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/article.dart';

class ArticleService {
  CollectionReference collectionReference =
      Firestore.instance.collection('articles');

  Future<List<Article>> getData() async {
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents.map((doc) => Article.fromMap(doc.data)).toList();
  }

  Stream<List<Article>> streamData() {
    return collectionReference.snapshots().map((list) =>
        list.documents.map((doc) => Article.fromMap(doc.data)).toList());
  }
}
