
import 'package:flutter/material.dart';
import 'package:work_out/inAppData/text.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: TextField(
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.5),
            size: 20,
          ),
          isDense: true,
          hintText: AppTexts.searchWorkout,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 14,
          ),
          filled: true,
          fillColor: const Color(0xff232441),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
