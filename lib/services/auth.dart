import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthService {
  /**
   * Auth
   */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<FirebaseUser> register(String email, password, username) async {
    final FirebaseUser newUser = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    // Création de l'utilisateur pour l'ajouter dans la bdd
    Map<String, dynamic> newUserInfos = {
      'uid': newUser.uid,
      'username': username,
      'email': email,
      'level': 1,
      'points': 0,
    };
    addUser(newUser.uid, newUserInfos);

    return newUser;
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser user = result.user;
    return user;
  }

  // Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }

  /**
   * Database
   */
  static final dataInstance = Firestore.instance;
  final userCollection = dataInstance.collection("users");

  addUser(String uid, Map<String, dynamic> newUserInfos) {
    userCollection.document(uid).setData(newUserInfos);
  }
}
