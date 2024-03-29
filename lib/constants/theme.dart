import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color egreen = Color(0xFF038C25);
const Color eblack = Color(0xFF242424);
const Color egrey = Color(0xFFECECEC);
const Color ewhite = Color(0xFFFFFFFF);
const Color ered = Color(0xFFFF0000);

class ThemeClass {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: eblack,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: eblack,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: eblack,
  );

  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: eblack,
  );

  static TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: eblack,
  );

  static TextStyle heading6 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: eblack.withOpacity(0.3),
  );

  static TextStyle heading7 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: eblack.withOpacity(0.3),
  );

  static TextStyle heading8 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: eblack.withOpacity(0.3),
  );

  static TextStyle heading9 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: eblack.withOpacity(0.3),
  );

  static TextStyle heading10 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: eblack.withOpacity(0.3),
  );

  static TextStyle heading11 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: eblack,
  );

  static TextStyle heading12 = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    color: eblack,
  );

  static TextStyle heading13 = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    color: ewhite,
  );

  static TextStyle loginHeading = GoogleFonts.poppins(
    fontSize: 44,
    fontWeight: FontWeight.w700,
    color: ewhite,
  );

  static TextStyle loginParagraph = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: ewhite.withOpacity(0.4),
  );

  static TextStyle contactPragraph = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: eblack,
  );

  static TextStyle connectorParapraph = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: egreen,
  );

  static TextStyle priceParapraph = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: eblack,
  );

  static SizedBox space0 = const SizedBox(height: 5);
  static SizedBox space1 = const SizedBox(height: 10);
  static SizedBox space2 = const SizedBox(height: 20);
  static SizedBox space3 = const SizedBox(height: 80);
  static SizedBox space4 = const SizedBox(width: 5);
  static SizedBox space5 = const SizedBox(width: 10);
  static SizedBox space6 = const SizedBox(width: 20);
  static EdgeInsetsGeometry padding =
      const EdgeInsets.only(top: 20, left: 10, right: 10);

  void successSnack() {
    Get.snackbar(
      'Success',
      'Data Inserted Successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ewhite,
      backgroundColor: egreen,
      titleText: Text(
        'Success',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
      messageText: Text(
        'Data Inserted Successfully',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
    );
  }

  void errorSnack(message) {
    Get.snackbar(
      'Error',
      'Failed to fetch data: $message',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ewhite,
      backgroundColor: ered,
      titleText: Text(
        'Error',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
      messageText: Text(
        'Failed to fetch data: $message',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
    );
  }

  void warningSnack() {
    Get.snackbar(
      'Issue',
      'Try adding some data',
      snackPosition: SnackPosition.BOTTOM,
      colorText: eblack,
      backgroundColor: egrey,
      titleText: Text(
        'Issue',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: eblack,
        ),
      ),
      messageText: Text(
        'Try adding some data',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: eblack,
        ),
      ),
    );
  }

  void locationSnack() {
    Get.snackbar(
      'Permission',
      'Need permission to access locationa and to fetch data, Otherwise cant trace station',
      snackPosition: SnackPosition.BOTTOM,
      colorText: eblack,
      backgroundColor: egrey,
      titleText: Text(
        'Permission',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: eblack,
        ),
      ),
      messageText: Text(
        'Need permission to access locationa and to fetch data, Otherwise cant trace station',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: eblack,
        ),
      ),
    );
  }

  void googleSnack(e) {
    Get.snackbar(
      'Error',
      'An unecpected error occured during sigin: $e',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ewhite,
      backgroundColor: ered,
      titleText: Text(
        'Error',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
      messageText: Text(
        'An unecpected error occured during sigin: $e',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: ewhite,
        ),
      ),
    );
  }
}
