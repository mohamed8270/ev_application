// ignore_for_file: deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class UserRequestMapView extends StatelessWidget {
  final int index;
  UserRequestMapView({super.key, required this.index});

  final supabaseHelper = Get.put(SupaBaseHelper());
  final GeoLocationService geoLocationService = Get.put(GeoLocationService());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final data = supabaseHelper.stations[index];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/326479/arrow-back-outline.svg',
          click: () => Get.back(),
          title: 'Consumer Location',
          actions: const [],
        ),
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          color: egreen.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: FlutterMap(
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
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
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
        ),
      ),
    );
  }
}
