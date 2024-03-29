// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:ev_application/interface/user_input.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class UserChargeRequestPage extends StatefulWidget {
  const UserChargeRequestPage({super.key});

  @override
  State<UserChargeRequestPage> createState() => _UserChargeRequestPageState();
}

class _UserChargeRequestPageState extends State<UserChargeRequestPage> {
  SupaBaseHelper supaBaseHelper = Get.put(SupaBaseHelper());
  GeoLocationService geoLocationService = Get.put(GeoLocationService());
  var usernameController = TextEditingController();
  var usercontactController = TextEditingController();
  var vehiclenameController = TextEditingController();
  var vehiclenumController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var locationController = TextEditingController();
  var emergencyController = TextEditingController();
  var issueController = TextEditingController();
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();
  String emergency = 'Emergency';
  String noemergency = 'At Time';
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
        'latitude': latitudeController.text,
        'longitude': longitudeController.text,
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
                    onTap: () async {
                      Position? position =
                          await geoLocationService.getLocation();
                      if (position != null) {
                        double latitude = position.latitude;
                        double longitude = position.longitude;
                        String latitudeData = latitude.toString();
                        String longitudeData = longitude.toString();
                        String mapUrl =
                            "https://www.openstreetmap.org/?lon=$longitude&lat=$latitude&zoom=19";
                        setState(() {
                          locationController.text = mapUrl;
                          latitudeController.text = latitudeData;
                          longitudeController.text = longitudeData;
                        });
                      }
                    },
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
                        activeColor: ered,
                        inactiveColor: egreen.withOpacity(0.4),
                        borderRadius: 30,
                        padding: 8,
                        toggleSize: 45,
                        showOnOff: true,
                        valueFontSize: 25,
                        onToggle: (value) {
                          setState(() {
                            status = value;
                          });
                          print(status);
                          if (status == true) {
                            setState(() {
                              emergencyController.text = emergency;
                            });
                          } else if (status == false) {
                            emergencyController.text = noemergency;
                          }
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
