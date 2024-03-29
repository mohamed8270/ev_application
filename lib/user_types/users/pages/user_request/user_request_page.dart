import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:ev_application/interface/user_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
  bool status = false;

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
    final screenSize = MediaQuery.sizeOf(context);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Person Details',
                style: ThemeClass.heading3,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/473980/profile.svg',
                txt: 'Name',
                type: TextInputType.name,
                userController: usernameController,
                mode: false,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/473980/profile.svg',
                txt: 'Phone',
                type: TextInputType.number,
                userController: usercontactController,
                mode: false,
              ),
              ThemeClass.space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink:
                        'https://www.svgrepo.com/show/325163/ev-charge-alt.svg',
                    txt: 'Vehicle Name',
                    type: TextInputType.text,
                    userController: vehiclenameController,
                    mode: false,
                  ),
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink: 'https://www.svgrepo.com/show/522989/plate.svg',
                    txt: 'Vehicle Reg. num',
                    type: TextInputType.text,
                    userController: vehiclenumController,
                    mode: false,
                  ),
                ],
              ),
              ThemeClass.space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink:
                        'https://www.svgrepo.com/show/408361/event-calender-date-note.svg',
                    txt: 'Date',
                    type: TextInputType.text,
                    userController: dateController,
                    mode: false,
                  ),
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink:
                        'https://www.svgrepo.com/show/490412/time-oclock.svg',
                    txt: 'Time',
                    type: TextInputType.text,
                    userController: timeController,
                    mode: false,
                  ),
                ],
              ),
              ThemeClass.space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: AbsorbPointer(
                      child: UserInputWidget(
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.45,
                        icnLink:
                            'https://www.svgrepo.com/show/532540/location-pin-alt-1.svg',
                        txt: 'Location',
                        type: TextInputType.url,
                        userController: locationController,
                        mode: true,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency',
                        style: ThemeClass.emergencyText,
                      ),
                      FlutterSwitch(
                        value: status,
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.15,
                        borderRadius: 30,
                        padding: 8,
                        toggleSize: 45,
                        showOnOff: true,
                        valueFontSize: 25,
                        onToggle: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/497002/data-2.svg',
                txt: 'Query or Issue',
                type: TextInputType.text,
                userController: issueController,
                mode: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
