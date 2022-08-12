// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/models/student_model.dart';
// import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';

// class FirebaseAuthService {
//   FirebaseAuthService({this.uid});
//   final db = FirebaseFirestore.instance;
//   String? uid;

  // Future<void> createUser({required AppUser user}) async {
  //   await db.collection("users").doc(uid).set(user.toMap());
  //   return;
  // }
  // Future<void> deleteMyAccount(String userid) async {
  //   try {
  //     // delete user data
  //     FirebasePath.userDoc(userid).delete();
  //     // delete user from authentication
  //     FirebaseAuth.instance.currentUser!.delete();
  //   } catch (e) {
  //     debugPrint('delete catch error: ' + e.toString());
  //   }
  // }

// }
