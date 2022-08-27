import 'package:flutter/material.dart';

class CheckMark extends StatelessWidget {
  const CheckMark(
      {Key? key,
      required this.isChecked,
      required this.opacity,
      required this.isTappedDown})
      : super(key: key);
  final bool isChecked, isTappedDown;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: isChecked || isTappedDown ? 1 : 0,
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
      ),
    );
  }
}
