// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:ev_application/interface/user_input.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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

  TimeOfDay initialTime = TimeOfDay.now();
  void timeFetch() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (newTime != null) {
      setState(() {
        initialTime = newTime;
        print(initialTime);
        timeController.text = initialTime.format(context);
        print(timeController.text);
      });
    }
  }

  DateTime? selectedFromDate;

  // Select Date Function
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedFromDate) {
      setState(() {
        selectedFromDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: InkWell(
        onTap: () => insertUserRequestData(),
        child: Container(
          height: screenSize.height * 0.08,
          width: screenSize.width,
          decoration: const BoxDecoration(color: egreen),
          alignment: Alignment.center,
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: ewhite,
                    strokeWidth: 2.5,
                    strokeCap: StrokeCap.round,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                )
              : Text(
                  'Request Port',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ewhite,
                  ),
                ),
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
                icnLink: 'https://www.svgrepo.com/show/533284/phone-alt.svg',
                txt: 'Phone',
                type: TextInputType.number,
                userController: usercontactController,
                mode: false,
              ),
              ThemeClass.space2,
              Text(
                'Vehicle Details',
                style: ThemeClass.heading3,
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
              ThemeClass.space2,
              Text(
                'Service Details',
                style: ThemeClass.heading3,
              ),
              ThemeClass.space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => selectDate(context),
                    child: AbsorbPointer(
                      child: UserInputWidget(
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.45,
                        icnLink:
                            'https://www.svgrepo.com/show/408361/event-calender-date-note.svg',
                        txt: 'Date',
                        type: TextInputType.text,
                        userController: dateController,
                        mode: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => timeFetch(),
                    child: AbsorbPointer(
                      child: UserInputWidget(
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.45,
                        icnLink:
                            'https://www.svgrepo.com/show/490412/time-oclock.svg',
                        txt: 'Time',
                        type: TextInputType.text,
                        userController: timeController,
                        mode: true,
                      ),
                    ),
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
                        width: screenSize.width * 0.7,
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
                      ThemeClass.space0,
                      FlutterSwitch(
                        value: status,
                        height: screenSize.height * 0.04,
                        width: screenSize.width * 0.2,
                        activeColor: egreen.withOpacity(0.4),
                        inactiveColor: egrey,
                        borderRadius: 30,
                        padding: 8,
                        toggleSize: 20,
                        showOnOff: false,
                        valueFontSize: 10,
                        onToggle: (value) {
                          setState(() {
                            status = value;
                          });
                          print(status);
                          if (status == true) {
                            setState(() {
                              emergencyController.text = emergency;
                              print(emergencyController.text);
                            });
                          } else if (status == false) {
                            emergencyController.text = noemergency;
                            print(emergencyController.text);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.09,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/497002/data-2.svg',
                txt: 'Query or Issue',
                type: TextInputType.text,
                userController: issueController,
                mode: false,
              ),
              const Gap(80),
            ],
          ),
        ),
      ),
    );
  }
}
