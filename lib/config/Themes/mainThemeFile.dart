import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/widgets/general_widgets/customMaterialColor.dart';
import '../Colors.dart';
import 'inputDecoration.dart';

class MainTheme {
  static final inputDecoration = inputDecorationTheme;

  MainTheme(this.context);

  late BuildContext context;

  late ThemeData themeData = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colorCustom,
    ),
    inputDecorationTheme: MainTheme.inputDecoration,
    primaryColor: AppColors.green,
  );
}
