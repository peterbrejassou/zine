import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/defi.dart';

class DefiService {
  CollectionReference collectionReference =
      Firestore.instance.collection('defis');

  Future<Defi> getOneData(String defiId) async {
    var doc = await collectionReference.document(defiId).get();
    return Defi.fromMap(doc.data);
  }

  Future<List<Defi>> getData() async {
    var snapshots = await collectionReference.getDocuments();
    return snapshots.documents.map((doc) => Defi.fromMap(doc.data)).toList();
  }

  Future<List<Defi>> getDefisOfCategory(String categoryId) async {
    var snapshots = await collectionReference
        .where('category', isEqualTo: categoryId)
        .getDocuments();
    return snapshots.documents.map((doc) => Defi.fromMap(doc.data)).toList();
  }

  Stream<List<Defi>> streamData() {
    return collectionReference.snapshots().map(
        (list) => list.documents.map((doc) => Defi.fromMap(doc.data)).toList());
  }

  Stream<List<Defi>> streamDefisOfCategory(String categoryId) {
    return collectionReference
        .where('category', isEqualTo: categoryId)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Defi.fromMap(doc.data)).toList());
  }
}
