import 'package:ev_application/interface/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChargeRequestPage extends StatelessWidget {
  const UserChargeRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/326479/arrow-back-outline.svg',
          click: () => Get.back(),
          title: 'Request Port',
          actions: const [],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
