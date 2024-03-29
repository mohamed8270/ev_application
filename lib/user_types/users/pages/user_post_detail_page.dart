// ignore_for_file: deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:ev_application/user_types/users/components/user_station_avail_repo.dart';
import 'package:ev_application/user_types/users/pages/user_request/user_request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserSidePostDetailPage extends StatelessWidget {
  final int index;
  UserSidePostDetailPage({super.key, required this.index});

  final supabaseHelper = Get.put(SupaBaseHelper());
  final MapController mapController = MapController();
  final GeoLocationService geoLocationService = Get.put(GeoLocationService());

  Future<LatLng> latLong() async {
    final Position? position = await geoLocationService.getLocation();
    double latitude = position!.latitude;
    double longitude = position.longitude;
    return LatLng(latitude, longitude);
  }

  Color checkAvailability(availability) {
    switch (availability) {
      case 'Open':
        return egreen;
      case 'Close':
        return ered;
      default:
        return egrey;
    }
  }

  Color checkMembership(member) {
    switch (member) {
      case 'Yes':
        return egreen;
      case 'No':
        return ered;
      default:
        return egrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final data = supabaseHelper.stations[index];
    final webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(egrey)
      ..loadRequest(
        Uri.parse(data['location_link'].toString()),
      );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/326479/arrow-back-outline.svg',
          click: () => Get.back(),
          title: 'Station Details',
          actions: const [],
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
                    '₹${data['cost_per_kwh'].toString()}',
                    style: ThemeClass.heading1,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Get.to(const UserChargeRequestPage()),
              child: Container(
                height: screenSize.height,
                width: screenSize.width * 0.5,
                decoration: const BoxDecoration(color: egreen),
                alignment: Alignment.center,
                child: Text(
                  'Charge',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.4,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: egrey.withOpacity(0.2),
              ),
              alignment: Alignment.center,
              child: data['latitude'] != null
                  ? FlutterMap(
                      options: MapOptions(
                        keepAlive: true,
                        initialCenter: LatLng(
                          double.parse(data['latitude']),
                          double.parse(data['longitude']),
                        ),
                        initialZoom: 10,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          userAgentPackageName: "com.example.ev_application",
                        ),
                        MarkerLayer(
                          rotate: false,
                          markers: [
                            Marker(
                              rotate: false,
                              point: LatLng(double.parse(data['latitude']),
                                  double.parse(data['longitude'])),
                              child: SvgPicture.network(
                                'https://www.svgrepo.com/show/474059/location.svg',
                                height: 25,
                                width: 25,
                                color: egreen,
                                theme: const SvgTheme(currentColor: egreen),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : WebViewWidget(controller: webviewController),
            ),
            Padding(
              padding: ThemeClass.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.65,
                            child: Text(
                              data['station_name'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: ThemeClass.heading11,
                            ),
                          ),
                          Text(
                            data['address'].toString(),
                            style: ThemeClass.heading10,
                          ),
                          Text(
                            data['location'].toString(),
                            style: ThemeClass.heading10,
                          ),
                        ],
                      ),
                      CheckUserAvailRepo(
                        txt: '₹${data['time_based_pricing'].toString()} / hr',
                        color: eblack.withOpacity(0.4),
                      ),
                    ],
                  ),
                  ThemeClass.space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CheckUserAvailRepo(
                        txt: data['availability'].toString(),
                        color: checkAvailability(data['availability']),
                      ),
                      ThemeClass.space4,
                      CheckUserAvailRepo(
                        txt: 'Membership: ${data['membership'].toString()}',
                        color: checkMembership(data['membership']),
                      ),
                    ],
                  ),
                  ThemeClass.space2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${data['type'].toString()},',
                        style: ThemeClass.connectorParapraph,
                      ),
                      ThemeClass.space4,
                      Text(
                        data['connector'].toString(),
                        style: ThemeClass.connectorParapraph,
                      ),
                    ],
                  ),
                  ThemeClass.space0,
                  Text(
                    data['description'].toString(),
                    style: ThemeClass.heading4,
                  ),
                  ThemeClass.space2,
                  Text(
                    'Contact Details',
                    style: ThemeClass.contactPragraph,
                  ),
                  ThemeClass.space0,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data['email'].toString(),
                        style: ThemeClass.heading10,
                      ),
                      ThemeClass.space5,
                      Text(
                        data['phone'].toString(),
                        style: ThemeClass.heading10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
