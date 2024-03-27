import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/service/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
          title: 'Station Details',
          actions: const [],
        ),
      ),
      body: Padding(
        padding: ThemeClass.padding,
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.4,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: egrey.withOpacity(0.2),
              ),
              child: FlutterMap(
                mapController: mapController,
                options: const MapOptions(
                  keepAlive: true,
                  initialZoom: 10,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: "com.example.ev_application",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: point,
                        child: SvgPicture.network(
                          'https://www.svgrepo.com/show/474059/location.svg',
                          height: 25,
                          width: 25,
                          theme: const SvgTheme(currentColor: egreen),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              data['station_name'].toString(),
              style: ThemeClass.heading11,
            ),
            ThemeClass.space1,
          ],
        ),
      ),
    );
  }
}
