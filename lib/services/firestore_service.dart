import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolphotoapp/models/student_model.dart';
import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';

class FirestoreService {
  addStudentToFirestore(User? user) async {
    try {
      await firebaseFirestore.collection('students').doc(user!.uid).set({
        "id": user.uid.trim(),
        "fullName": user.displayName!.trim(),
        "email": user.email!.trim(),
        "profileUrl": user.photoURL ?? '',
        'lastActivityDateTime': DateTime.now(),
        "fcmToken": '',
      }, SetOptions(merge: true));
    } catch (e) {
      print('Here it comes while writing users data into firestore ');
      print(e);
    }
  }

  Future<StudentModel?> getUserFromFirestore(String userid) async {
    try {
      final student =
          await firebaseFirestore.collection('students').doc(userid).get();
      return StudentModel.fromMap(student.data()!);
    } catch (e) {
      print('Here it comes while getting student data from firestore ');
      print(e);
    }
  }

  Future<bool> checkIfUserDataExists(User? user) async {
    try {
      final student =
          await firebaseFirestore.collection('students').doc(user!.uid).get();
      print('oooooo ${student.exists}');
      return student.exists;
    } catch (e) {
      print('Here it comes while checking if user data exists in firestore ');
      print(e);
      return false;
    }
  }

  Future<void> uploadNewMediaItemsActivity() async {}
}
