import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChargeRequestPage extends StatefulWidget {
  const UserChargeRequestPage({super.key});

  @override
  State<UserChargeRequestPage> createState() => _UserChargeRequestPageState();
}

class _UserChargeRequestPageState extends State<UserChargeRequestPage> {
  SupaBaseHelper supaBaseHelper = Get.put(SupaBaseHelper());
  var usernameController = TextEditingController();
  var usercontactController = TextEditingController();
  var vehiclenameController = TextEditingController();
  var vehiclenumController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var locationController = TextEditingController();
  var emergencyController = TextEditingController();
  var issueController = TextEditingController();
  bool isLoading = false;

  Future<void> insertUserRequestData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final Map<String, dynamic> data = {
        'name': usernameController.text,
        'contact': usercontactController.text,
        'vehicle_name': vehiclenameController.text,
        'vehicle_num': vehiclenumController.text,
        'date': dateController.text,
        'time': timeController.text,
        'location': locationController.text,
        'emergency': emergencyController.text,
        'issue': issueController.text,
      };
      await supaBaseHelper.insertRequestData(data);
      setState(() {
        isLoading = false;
      });
      Get.to(const UserBottomNavBar());
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: ThemeClass.padding,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
