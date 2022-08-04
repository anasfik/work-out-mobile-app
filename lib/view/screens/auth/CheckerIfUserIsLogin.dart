// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_out/view/screens/auth/EmailVerification.dart';
import 'package:work_out/view/screens/homepage/homePage.dart';

import '../../../inAppData/text.dart';
import '../welcome/welcomePage.dart';

class CheckerIfUserIsLogin extends StatefulWidget {
  const CheckerIfUserIsLogin({Key? key}) : super(key: key);

  @override
  State<CheckerIfUserIsLogin> createState() => _CheckerIfUserIsLoginState();
}

class _CheckerIfUserIsLoginState extends State<CheckerIfUserIsLogin> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(AppTexts.error),
              );
            } else if (snapshot.hasData &&
                FirebaseAuth.instance.currentUser!.emailVerified) {
              return HomePage();
            } else if (snapshot.hasData &&
                user != null &&
                !user!.emailVerified) {
              return EmailVerificatioPage();
            } else {
              return WelcomePage();
            }
          }),
    );
  }
}
