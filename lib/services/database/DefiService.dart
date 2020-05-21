import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/Defi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/services/AuthService.dart';

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

  Future<List<Defi>> getDefisOfUser() async {
    FirebaseUser user = await AuthService().getUser;
    var defisUser = await collectionReference
        .where("users", arrayContains: user.uid)
        .getDocuments();
    return defisUser.documents.map((doc) => Defi.fromMap(doc.data)).toList();
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

  /* Stream<List<Defi>> streamDefisOfUser(userUid) {
    return collectionReference
        .where('users', arrayContains: userUid)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Defi.fromMap(doc.data)).toList());
  } */
}
