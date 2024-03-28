import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';

class CheckUserAvailRepo extends StatelessWidget {
  const CheckUserAvailRepo({super.key, required this.txt, required this.color});

  final String txt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        height: screenSize.height * 0.04,
        // width: screenSize.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            txt,
            style: ThemeClass.heading13,
          ),
        ),
      ),
    );
  }
}
