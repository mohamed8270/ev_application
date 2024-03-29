// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/user_types/admin/components/admin_post_button.dart';
import 'package:ev_application/user_types/admin/components/geo_location_web_view/location_web_view.dart';
import 'package:ev_application/user_types/admin/components/user_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});
  final supabase = Supabase.instance.client;
  final SupaBaseHelper supaBaseHelper = Get.put(SupaBaseHelper());
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);
    final user = supabase.auth.currentUser;
    final userName = user!.userMetadata?['full_name'];
    final profileImageUrl = user.userMetadata?['avatar_url'];
    // final profileMail = user.userMetadata?['email'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/491107/power.svg',
          click: () {},
          title: "Caroxi",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () => Get.toNamed('adminpostdetailpage'),
                child: SvgPicture.network(
                  'https://www.svgrepo.com/show/524051/gas-station.svg',
                  height: 26,
                  width: 26,
                  color: egreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundColor: egrey.withOpacity(0.4),
                radius: 18,
                child: ClipOval(
                  child: Image.network(
                    profileImageUrl == null
                        ? 'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small/profile-icon-design-free-vector.jpg'
                        : profileImageUrl.toString(),
                    height: 34,
                    width: 34,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: ThemeClass.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Greetings, $userName',
                  style: ThemeClass.heading11,
                ),
                ThemeClass.space0,
                Text(
                  'Reach the electric station at time without any rush',
                  style: ThemeClass.heading10,
                ),
                ThemeClass.space2,
                const AdminPostButton(),
                ThemeClass.space2,
                Text(
                  "Requested EV's",
                  style: ThemeClass.heading2,
                ),
                ThemeClass.space1,
                ListView.builder(
                  itemCount: supaBaseHelper.requestData.length,
                  itemBuilder: (ctx, idx) {
                    final requestdata = supaBaseHelper.requestData[idx];
                    return UserResquestDataRepo(
                      id: requestdata['_id'].toString(),
                      username: requestdata['name'].toString(),
                      companyName: requestdata['stationname'].toString(),
                      vehicleName: requestdata['vehicle_name'].toString(),
                      vehicleNum: requestdata['vehicle_num'].toString(),
                      date: requestdata['date'].toString(),
                      time: requestdata['time'].toString(),
                      emergency: requestdata['emergency'].toString(),
                      contact: requestdata['contact'].toString(),
                      locationClick: () =>
                          Get.to(UserRequestMapView(index: idx)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
