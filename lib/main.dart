import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/Themes/mainThemeFile.dart';
import 'package:work_out/view/components/general%20componenets/customMaterialColor.dart';
import 'package:work_out/view/screens/auth/CheckerIfUserIsLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/authControllers/authchangesListener.dart';
import 'firebase_options.dart';

void main() async {
  // init binding
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // set the orientation to portrait only (there is no need for landscape)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  WorkoutApp({Key? key}) : super(key: key);

  // Dependency injection
  final AuthChangesListener authListener =
      Get.put(AuthChangesListener(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.native,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colorCustom,
        ),
        inputDecorationTheme: MainTheme.inputDecoration,
        primaryColor: AppColors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const CheckerIfUserIsLogin(),
    );
  }
}
