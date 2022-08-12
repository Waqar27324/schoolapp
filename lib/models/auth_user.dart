import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  AuthStatus? authStatus;
  String? error;
  User? user;
  UserAuth({this.authStatus, this.error, this.user});
}

enum AuthStatus {
  LoggedInFail,
  RegistrationFail,
  LoggedInSuccess,
  RegistreredSuccess,
  LogingInProgress,
  RegistrationInProgress,
  Signout,
}
