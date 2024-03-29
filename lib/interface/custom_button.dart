import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.radius,
      required this.color,
      required this.txt,
      required this.click,
      required this.txtsize,
      required this.txtcolor});

  final double height;
  final double width;
  final double radius;
  final Color color;
  final String txt;
  final double txtsize;
  final Color txtcolor;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      alignment: Alignment.center,
      child: Text(
        txt,
        style: GoogleFonts.poppins(
          fontSize: txtsize,
          fontWeight: FontWeight.w600,
          color: txtcolor,
        ),
      ),
    );
  }
}
