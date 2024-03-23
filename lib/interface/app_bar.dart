// ignore_for_file: deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.actions,
    required this.click,
  });

  final String leading;
  final String title;
  final List<Widget> actions;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: egrey,
              width: 0.5,
            ),
          ),
        ),
      ),
      centerTitle: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: click,
          child: SvgPicture.network(
            leading,
            height: 12,
            width: 12,
            color: egreen,
          ),
        ),
      ),
      title: Text(
        title,
        style: ThemeClass.heading1,
      ),
      actions: actions,
    );
  }
}
