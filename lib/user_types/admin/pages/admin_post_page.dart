// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/admin_bottom_nav_bar.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/interface/user_input.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPostPage extends StatefulWidget {
  const AdminPostPage({super.key});

  @override
  State<AdminPostPage> createState() => _AdminPostPageState();
}

class _AdminPostPageState extends State<AdminPostPage> {
  SupaBaseHelper supaBaseHelper = Get.put(SupaBaseHelper());
  GeoLocationService geoLocationService = Get.put(GeoLocationService());

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var stationController = TextEditingController();
  var availableController = TextEditingController();
  var locationController = TextEditingController();
  var typeController = TextEditingController();
  var connectorController = TextEditingController();
  var descriptioController = TextEditingController();
  var kwhController = TextEditingController();
  var timekwhController = TextEditingController();
  var memberController = TextEditingController();
  var locationlinkController = TextEditingController();
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();
  String availabilityOption = 'Open';
  String memberOption = 'Yes';
  String kWh = '';
  bool isLoading = false;

  Future<void> insertStationData() async {
    print('function called');
    try {
      setState(() {
        isLoading = true;
      });
      final Map<String, dynamic> data = {
        'name': nameController.text,
        'email': mailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'station_name': stationController.text,
        'location': locationController.text,
        'availability': availableController.text,
        'type': typeController.text,
        'connector': connectorController.text,
        'cost_per_kwh': kwhController.text,
        'time_based_pricing': timekwhController.text,
        'membership': memberController.text,
        'description': descriptioController.text,
        'location_link': locationlinkController.text,
        'latitude': latitudeController.text,
        'longitude': longitudeController.text,
      };
      await supaBaseHelper.insertStationData(data);
      setState(() {
        isLoading = false;
      });
      Get.to(const AdminBottomNavBar());
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  @override
  void initState() {
    super.initState();
    memberController.text = memberOption;
    availableController.text = availabilityOption;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/326479/arrow-back-outline.svg',
          title: 'EV Station',
          actions: [],
          click: () => Get.back(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
        height: screenSize.height * 0.08,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cost per KWh',
                    style: ThemeClass.heading12,
                  ),
                  Text(
                    '₹ $kWh',
                    style: ThemeClass.heading1,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => insertStationData(),
              child: Container(
                height: screenSize.height,
                width: screenSize.width * 0.5,
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
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ewhite,
                        ),
                      ),
              ),
            ),
          ],
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
                'Owner Details',
                style: ThemeClass.heading3,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/473980/profile.svg',
                txt: 'Name',
                type: TextInputType.name,
                userController: nameController,
                mode: false,
              ),
              ThemeClass.space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink: 'https://www.svgrepo.com/show/488920/email.svg',
                    txt: 'Email',
                    type: TextInputType.emailAddress,
                    userController: mailController,
                    mode: false,
                  ),
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink:
                        'https://www.svgrepo.com/show/533284/phone-alt.svg',
                    txt: 'Phone',
                    type: TextInputType.number,
                    userController: phoneController,
                    mode: false,
                  ),
                ],
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.09,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/500652/place.svg',
                txt: 'Address',
                type: TextInputType.streetAddress,
                userController: addressController,
                mode: false,
              ),
              ThemeClass.space2,
              Text(
                'Station Details',
                style: ThemeClass.heading3,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/522865/gas-station.svg',
                txt: 'Station Name',
                type: TextInputType.name,
                userController: stationController,
                mode: false,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/532539/location-pin.svg',
                txt: 'Location',
                type: TextInputType.text,
                userController: locationController,
                mode: false,
              ),
              ThemeClass.space1,
              GestureDetector(
                onTap: () async {
                  Position? position = await geoLocationService.getLocation();
                  if (position != null) {
                    double latitude = position.latitude;
                    double longitude = position.longitude;
                    String latitudeData = latitude.toString();
                    String longitudeData = longitude.toString();
                    String mapUrl =
                        "https://www.openstreetmap.org/?lon=$longitude&lat=$latitude&zoom=19";
                    setState(() {
                      locationlinkController.text = mapUrl;
                      latitudeController.text = latitudeData;
                      longitudeController.text = longitudeData;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.95,
                    icnLink:
                        'https://www.svgrepo.com/show/532535/location-crosshairs.svg',
                    txt: 'Location Link',
                    type: TextInputType.url,
                    userController: locationlinkController,
                    mode: true,
                  ),
                ),
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.4,
                icnLink:
                    'https://www.svgrepo.com/show/309973/shifts-availability.svg',
                txt: 'Availability',
                type: TextInputType.text,
                userController: availableController,
                mode: true,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.4,
                    child: RadioListTile(
                      value: 'Open',
                      title: Text(
                        'Open',
                        style: ThemeClass.heading9,
                      ),
                      activeColor: egreen,
                      groupValue: availabilityOption,
                      onChanged: (value) {
                        setState(() {
                          availabilityOption = value!;
                          availableController.text = value;
                        });
                      },
                    ),
                  ),
                  ThemeClass.space2,
                  SizedBox(
                    width: screenSize.width * 0.4,
                    child: RadioListTile(
                      value: 'Closed',
                      title: Text(
                        'Closed',
                        style: ThemeClass.heading9,
                      ),
                      groupValue: availabilityOption,
                      onChanged: (value) {
                        setState(() {
                          availabilityOption = value!;
                          availableController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/361383/type-hierarchy.svg',
                txt: 'Level 1, Level 2, DC Fast Charging, Tesla Supercharger',
                type: TextInputType.text,
                userController: typeController,
                mode: false,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/461745/jack-connector-1.svg',
                txt: 'J1772, CHAdeMO, CCS, Tesla',
                type: TextInputType.text,
                userController: connectorController,
                mode: false,
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/521125/data.svg',
                txt: 'Description',
                type: TextInputType.text,
                userController: descriptioController,
                mode: false,
              ),
              ThemeClass.space2,
              Text(
                'Pricing Details',
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
                        'https://www.svgrepo.com/show/525212/wireless-charge.svg',
                    txt: 'Cost per kWh',
                    type: TextInputType.number,
                    userController: kwhController,
                    mode: false,
                    changed: (p0) {
                      setState(() {
                        kWh = p0;
                      });
                    },
                  ),
                  UserInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.45,
                    icnLink:
                        'https://www.svgrepo.com/show/345307/clock-time-watch-hour-deadline-timer-dial.svg',
                    txt: 'Time-based Pricing',
                    type: TextInputType.text,
                    userController: timekwhController,
                    mode: false,
                  ),
                ],
              ),
              ThemeClass.space1,
              UserInputWidget(
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.4,
                icnLink: 'https://www.svgrepo.com/show/497914/crown-1.svg',
                txt: 'Membership',
                type: TextInputType.text,
                userController: memberController,
                mode: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.33,
                    child: RadioListTile(
                      value: 'Yes',
                      title: Text(
                        'Yes',
                        style: ThemeClass.heading9,
                      ),
                      activeColor: egreen,
                      groupValue: memberOption,
                      onChanged: (value) {
                        setState(() {
                          memberOption = value!;
                          memberController.text = value;
                        });
                      },
                    ),
                  ),
                  ThemeClass.space2,
                  SizedBox(
                    width: screenSize.width * 0.33,
                    child: RadioListTile(
                      value: 'No',
                      title: Text(
                        'No',
                        style: ThemeClass.heading9,
                      ),
                      groupValue: memberOption,
                      onChanged: (value) {
                        setState(() {
                          memberOption = value!;
                          memberController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ThemeClass.space3,
            ],
          ),
        ),
      ),
    );
  }
}
