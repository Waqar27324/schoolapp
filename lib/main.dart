import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:schoolphotoapp/utils/constants/app_data.dart';
import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
import 'package:schoolphotoapp/views/ui/authentication/auth.dart';
import 'package:schoolphotoapp/views/ui/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  firebaseUser = auth.currentUser;
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize:
            // Size(size.height,
            //     size.width), // Size(this.screenUtilHeight, this.screenUtilWidth),
            Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: MyColors.primaryColor,
              fontFamily: primaryFont,
              textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
                headline3: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                headline5: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
                headline6: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                bodyText1:
                    TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
                bodyText2: TextStyle(fontSize: 17.sp, fontFamily: 'Poppins'),
              ),
            ),
            home: gotoLandingPage(context),
          );
        });
  }

  Widget gotoLandingPage(context) {
    var authProvider =
        Provider.of<FirebaseAuthViewModel>(context, listen: false);
    if (firebaseUser != null) {
      FirebaseAuth.instance.currentUser?.providerData.forEach((user) {
        if (user.providerId == 'google.com') {
          print(user.toString());
        } else {
          print(user.toString());
        }
      });
      authProvider.getStudentDataFromFirebase(firebaseUser!.uid);
      print('user is not null');
    } else {
      print('user is null');
    }
    return (FirebaseAuth.instance.currentUser != null)
        ? const HomeScreen()
        : const AuthScreen();
  }
}
