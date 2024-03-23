// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeoLocationService extends GetxController {
  Future<Position?> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        double latitude = position.latitude;
        double longitude = position.longitude;
        print('$latitude');
        print('$longitude');
        return position;
      } catch (e) {
        ThemeClass().errorSnack(e);
      }
    } else {
      ThemeClass().locationSnack();
    }
    return null;
  }
}
