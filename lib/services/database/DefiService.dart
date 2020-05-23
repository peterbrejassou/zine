import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zine/models/Defi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zine/services/AuthService.dart';

class DefiService {
  CollectionReference collectionReference =
      Firestore.instance.collection('defis');

  void addUserFromDefi(defiId) async {
    FirebaseUser user = await AuthService().getUser;
    DocumentSnapshot doc = await collectionReference.document(defiId).get();
    List<dynamic> defiUsers = doc.data['users'];

    collectionReference.document(defiId).updateData({
      "users": FieldValue.arrayUnion([user.uid])
    });
  }

  void removeUserFromDefi(defiId) async {
    FirebaseUser user = await AuthService().getUser;
    DocumentSnapshot doc = await collectionReference.document(defiId).get();
    List<dynamic> defiUsers = doc.data['users'];

    collectionReference.document(defiId).updateData({
      "users": FieldValue.arrayRemove([user.uid])
    });
  }

  /* void achievedStep(defiId, stepId) async {
    collectionReference
        .document(defiId)
        .collection("steps")
        .document(stepId)
        .updateData({"achieved": true});
  } */

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

  Future<List<Defi>> getDefisOfCategoryExceptUserDefis(
      String categoryId) async {
    FirebaseUser user = await AuthService().getUser;
    var defisNotUser = [];
    var snapshots = await collectionReference
        .where('category', isEqualTo: categoryId)
        .getDocuments();
    snapshots.documents.forEach((doc) {
      if (!doc.data['users'].contains(user.uid)) {
        defisNotUser.add(doc);
      }
    });

    return defisNotUser.map((doc) => Defi.fromMap(doc.data)).toList();
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
}
