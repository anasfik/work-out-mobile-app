import 'package:flutter/material.dart';

class CheckMark extends StatelessWidget {
  CheckMark({Key? key, required this.isChecked}) : super(key: key);
  bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isChecked,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff373850),
          borderRadius: BorderRadius.circular(50),
        ),
        width: 35,
        height: 35,
        child: Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
          size: 17,
        ),
      ),
    );
  }
}
