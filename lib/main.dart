import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:work_out/bindings/initial_binding.dart';
import 'package:work_out/config/Themes/mainThemeFile.dart';
import 'package:work_out/config/initial_main_methods/initial_main_methods.dart';
import 'config/routes.dart';

void main() async {
  await MainMethods.init();
  runApp(
    const WorkoutApp(),
  );
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      defaultTransition: Transition.rightToLeftWithFade,
      theme: MainTheme(context).themeData,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
      initialRoute: "/",
    );
  }
}
