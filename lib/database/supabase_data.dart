// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseHelper extends GetxController {
  final supabaseURL = dotenv.env['SUPABASE_URL'].toString();
  final supabaseAPI = dotenv.env['SUPABASE_API'].toString();
  late final SupabaseClient supabase;
  final stations = <Map<String, dynamic>>[].obs;
  final requestData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeSupaBase();
    fetchStationData();
    fetchRequestData();
  }

  void initializeSupaBase() {
    supabase = SupabaseClient(supabaseURL, supabaseAPI);
    print('Supabase Connected');
  }

  //  Station Holder API's
  Future<void> insertStationData(Map<String, dynamic> data) async {
    try {
      await supabase.from('stations').insert(data).select();
      fetchStationData();
      ThemeClass().successSnack();
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  Future<void> fetchStationData() async {
    try {
      final response = await supabase.from('stations').select();
      if (response.isNotEmpty) {
        stations.value = response;
      } else {
        ThemeClass().warningSnack();
      }
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  Future<void> updateStationData(int id, Map<String, dynamic> data) async {
    try {
      await supabase.from('stations').update(data).eq('id', id).select();
      fetchStationData();
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  Future<void> deleteStationData(int id) async {
    try {
      await supabase.from('stations').delete().eq('id', id);
      fetchStationData();
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  // User Request API's processing
  Future<void> insertRequestData(Map<String, dynamic> data) async {
    try {
      await supabase.from('user_charge_request').insert(data).select();
      fetchRequestData();
      ThemeClass().successSnack();
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  Future<void> fetchRequestData() async {
    try {
      final response = await supabase.from('user_charge_request').select();
      if (response.isNotEmpty) {
        requestData.value = response;
      } else {
        ThemeClass().warningSnack();
      }
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }

  Future<void> deleteRequestData(int id) async {
    try {
      await supabase.from('stations').delete().eq('id', id);
      fetchRequestData();
    } catch (e) {
      ThemeClass().errorSnack(e);
    }
  }
}
