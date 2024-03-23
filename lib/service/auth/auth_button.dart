import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.txt, required this.url, required this.click});

  final String txt;
  final String url;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: click,
      child: Container(
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.6,
        decoration: BoxDecoration(
          color: egrey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.network(
                url,
                height: 18,
                width: 18,
              ),
              Text(
                txt,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ewhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
