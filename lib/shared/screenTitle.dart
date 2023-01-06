import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  final Color color;

  const ScreenTitle({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.bounceInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding:
                //EdgeInsets.only(top: 20),
                EdgeInsets.symmetric(
                    horizontal: value * 30, vertical: value * 20),
            child: child,
          ),
        );
      },
      child: Text(
        text,
        style:
            TextStyle(fontSize: 36, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
