import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/Category.dart';

class CategoryService {
  CollectionReference collectionReference =
      Firestore.instance.collection('categories');

  Future<Category> getOneData(String categoryId) async {
    var doc = await collectionReference.document(categoryId).get();
    return Category.fromMap(doc.data);
  }

  Future<List<Category>> getData() async {
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents
        .map((doc) => Category.fromMap(doc.data))
        .toList();
  }

  Stream<List<Category>> streamData() {
    return collectionReference.snapshots().map((list) =>
        list.documents.map((doc) => Category.fromMap(doc.data)).toList());
  }
}
