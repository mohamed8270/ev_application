import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserTypeButton extends StatelessWidget {
  const UserTypeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Container(
          height: screenSize.height * 0.06,
          width: screenSize.width * 0.3,
          decoration: BoxDecoration(
            color: egrey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            'Car User',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: ewhite,
            ),
          ),
        ),
      ],
    );
  }
}
