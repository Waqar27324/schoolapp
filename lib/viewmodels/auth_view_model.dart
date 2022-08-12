import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schoolphotoapp/models/auth_user.dart';
import 'package:schoolphotoapp/models/student_model.dart';
import 'package:schoolphotoapp/services/base_model.dart';
import 'package:schoolphotoapp/services/firestore_service.dart';
import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';
import 'package:schoolphotoapp/utils/enums/view_state.dart';
import 'package:schoolphotoapp/views/ui/home/home_view.dart';

class FirebaseAuthViewModel extends BaseModel {
  var googleAccount = GoogleSignInAccount;

  Future<Map<String, String>>? authHeaders;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'profile',
    'https://www.googleapis.com/auth/photoslibrary',
    'https://www.googleapis.com/auth/photoslibrary.sharing',
    'https://www.googleapis.com/auth/photoslibrary.appendonly'
  ]);
  Future<void> logInWithGoogle(BuildContext context) async {
    try {
      setState(ViewState.Busy);
      final user = await signInWithGoogle();
      if (user != null) {
        final userExist = await FirestoreService().checkIfUserDataExists(user);
        if (userExist) {
          await getStudentDataFromFirebase(user.uid);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          await FirestoreService().addStudentToFirestore(user);
          // if (appUser != null) {
          studentModel.fullName = user.displayName!.trim();
          studentModel.email = user.email!.trim();
          studentModel.profileUrl = user.photoURL!.trim();
          studentModel.id = user.uid.trim();
          studentModel.fcmToken = '';
          studentModel.lastActivityDateTime = DateTime.now();
          firebaseUser = user;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          // }
        }
      } else {
        print('object is null');
      }
      setState(ViewState.Idle);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ' + e.code);
    } catch (e) {
      print('Catch Error: ' + e.toString());
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? _signInAccnt = await _googleSignIn.signIn();
      authHeaders = _signInAccnt!.authHeaders;
      if (_signInAccnt != null) {
        GoogleSignInAuthentication? _googleAuth =
            await _signInAccnt.authentication;
        final AuthCredential credentials = GoogleAuthProvider.credential(
            accessToken: _googleAuth.accessToken, idToken: _googleAuth.idToken);
        final userData = await auth.signInWithCredential(credentials);
        return userData.user;
      } else {
        return null;
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  getStudentDataFromFirebase(String userId) async {
    try {
      if (true) {
        print('aaa');
        GoogleSignInAccount? _signInAccnt =
            await _googleSignIn.signInSilently();
        authHeaders = _signInAccnt!.authHeaders;
        print(authHeaders.toString());
      }
      // else {
      //   print('bbb');
      // }
      final studentData = await FirestoreService().getUserFromFirestore(userId);
      if (studentData != null) {
        studentModel = studentData;
      }
      // notifyListeners();
      setState(ViewState.Idle);
    } catch (e) {
      print('getStudentDataFromFirebase: ' + e.toString());
    }
  }

  final _firebaseAuth = FirebaseAuth.instance;
  UserAuth _userAuth = UserAuth(authStatus: null, error: null, user: null);

  StudentModel studentModel = StudentModel(email: '', fullName: '');
  UserAuth get userAuth => _userAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // User? currentUser() {
  //   final User? user = _firebaseAuth.currentUser;
  //   return user;
  // }

  Future<void> signOut() async {
    // final GoogleSignIn googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    // final FacebookLogin facebookLogin = FacebookLogin();
    // await facebookLogin.logOut();
    return _firebaseAuth.signOut();
  }

  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<bool> deleteMyAccount(context) async {
    try {
      if (studentModel.id!.isNotEmpty) {
        // delete user data
        await firebaseFirestore
            .collection('students')
            .doc(studentModel.id!)
            .delete()
            .onError((error, stackTrace) =>
                print('user data deletion error' + error.toString()));
        // delete user from authentication
        await auth.currentUser!.delete().onError((error, stackTrace) =>
            print('user deletion error' + error.toString()));
        return true;
      } else {
        debugPrint('user is not valid: ');
        return false;
      }
    } catch (e) {
      debugPrint('delete catch error: ' + e.toString());
      return false;
    }
  }

  signinSilently() {}
}
