import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTypeButton extends StatelessWidget {
  const UserTypeButton({
    super.key,
    required this.txt,
    required this.click,
    required this.selected,
  });

  final String txt;
  final void Function(String) click;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => click(txt),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.3,
        decoration: BoxDecoration(
          color: selected ? egreen : egrey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          txt,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ewhite,
          ),
        ),
      ),
    );
  }
}
