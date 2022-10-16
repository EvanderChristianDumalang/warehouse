import 'package:database/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //User Obj based on Firebase
  MyUser? _fromFirebaseUser(User user)
  {
    // ignore: unnecessary_null_comparison
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //Change User Stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _fromFirebaseUser(user!));
  }

  //Sign In Anonymous
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _fromFirebaseUser(user!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  //Sign Out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}