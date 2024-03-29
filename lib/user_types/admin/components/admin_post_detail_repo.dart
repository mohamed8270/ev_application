import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPostDetailRepo extends StatelessWidget {
  const AdminPostDetailRepo({
    super.key,
    required this.station,
    required this.location,
    required this.availability,
    required this.type,
    required this.connector,
    required this.costperkwh,
    required this.timebased,
    required this.membership,
    required this.click,
    required this.longClick,
    required this.id,
  });

  final String id;
  final String station;
  final String location;
  final Color availability;
  final String type;
  final String connector;
  final String costperkwh;
  final String timebased;
  final Color membership;
  final VoidCallback click, longClick;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: InkWell(
        onTap: click,
        onLongPress: longClick,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: screenSize.height * 0.18,
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
                        Text(
                          id,
                          style: ThemeClass.connectorParapraph,
                        ),
                        Text(
                          station,
                          style: ThemeClass.heading2,
                        ),
                        Text(
                          location,
                          style: ThemeClass.heading10,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: availability,
                            ),
                            ThemeClass.space4,
                            Text(
                              'Availability',
                              style: ThemeClass.heading10,
                            ),
                          ],
                        ),
                        ThemeClass.space0,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: membership,
                            ),
                            ThemeClass.space4,
                            Text(
                              'Membership',
                              style: ThemeClass.heading10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          type,
                          style: ThemeClass.heading10,
                        ),
                        ThemeClass.space5,
                        Text(
                          connector,
                          style: ThemeClass.heading10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹ $costperkwh',
                              style: GoogleFonts.poppins(
                                fontSize: 34,
                                fontWeight: FontWeight.w500,
                                color: egreen,
                              ),
                            ),
                            ThemeClass.space4,
                            Text(
                              'Cost per kwh',
                              style: ThemeClass.heading12,
                            ),
                            ThemeClass.space1,
                          ],
                        ),
                        ThemeClass.space5,
                        Row(
                          children: [
                            Text(
                              '₹ $timebased',
                              style: ThemeClass.heading8,
                            ),
                            ThemeClass.space4,
                            Text(
                              'Time based',
                              style: ThemeClass.heading10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
