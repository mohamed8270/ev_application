import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserResquestDataRepo extends StatelessWidget {
  const UserResquestDataRepo({
    super.key,
    required this.id,
    required this.username,
    required this.companyName,
    required this.vehicleName,
    required this.vehicleNum,
    required this.date,
    required this.time,
    required this.emergency,
    required this.locationClick,
    required this.contact,
  });

  final String id;
  final String username;
  final String contact;
  final String companyName;
  final String vehicleName;
  final String vehicleNum;
  final String date;
  final String time;
  final String emergency;
  final VoidCallback locationClick;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.2,
      width: screenSize.width * 0.95,
      decoration: BoxDecoration(
        color: ewhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: egrey,
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          id,
                          style: ThemeClass.connectorParapraph,
                        ),
                        ThemeClass.space4,
                        Text(
                          companyName,
                          style: ThemeClass.heading10,
                        ),
                      ],
                    ),
                    Text(
                      vehicleName,
                      style: ThemeClass.heading2,
                    ),
                    Text(
                      emergency,
                      style: ThemeClass.heading10,
                    ),
                  ],
                ),
                InkWell(
                  onTap: locationClick,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: egreen.withOpacity(0.4),
                    child: SvgPicture.network(
                      'https://www.svgrepo.com/show/495430/location.svg',
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      style: ThemeClass.connectorParapraph,
                    ),
                    ThemeClass.space5,
                    Text(
                      contact,
                      style: ThemeClass.connectorParapraph,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      date,
                      style: ThemeClass.heading10,
                    ),
                    ThemeClass.space5,
                    Text(
                      time,
                      style: ThemeClass.heading10,
                    ),
                  ],
                ),
                Text(
                  vehicleNum,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: egreen,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
