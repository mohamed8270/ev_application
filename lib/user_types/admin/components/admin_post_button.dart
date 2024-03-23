import 'package:ev_application/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPostButton extends StatelessWidget {
  const AdminPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () => Get.toNamed('adminpostpage'),
      child: Container(
        height: screenSize.height * 0.12,
        width: screenSize.width * 0.95,
        decoration: BoxDecoration(
          color: ewhite,
          border: Border.all(
            color: egrey,
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.25,
                decoration: BoxDecoration(
                  color: ewhite,
                  borderRadius: BorderRadius.circular(3),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqlS3yeC7_qSu3s4zBWG2U3vidCCVYLDX3pw&usqp=CAU'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ThemeClass.space4,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upload EV Station',
                    style: ThemeClass.heading3,
                  ),
                  ThemeClass.space1,
                  Text(
                    'Post your station and get paid for it',
                    style: ThemeClass.heading10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
