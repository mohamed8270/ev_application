import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/user_types/admin/components/admin_post_detail_repo.dart';
import 'package:ev_application/user_types/users/pages/user_post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStationDetails extends StatelessWidget {
  UserStationDetails({super.key});

  final supaBaseHelper = Get.put(SupaBaseHelper());

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
    return Obx(
      () => ListView.builder(
        itemCount: supaBaseHelper.stations.length,
        itemBuilder: (context, index) {
          final station = supaBaseHelper.stations[index];
          return AdminPostDetailRepo(
            station: station['station_name'].toString(),
            location: station['location'].toString(),
            availability: checkAvailability(station['availability']),
            type: station['type'].toString(),
            connector: station['connector'].toString(),
            costperkwh: station['cost_per_kwh'].toString(),
            timebased: station['time_based_pricing'].toString(),
            membership: checkMembership(station['membership']),
            click: () => Get.to(
              UserSidePostDetailPage(
                index: index,
              ),
            ),
            longClick: () {},
          );
        },
      ),
    );
  }
}
