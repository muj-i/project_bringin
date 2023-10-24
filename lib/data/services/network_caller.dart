import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart';
import 'package:project_bringin/data/services/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));

      log(response.statusCode.toString());
      log('heleek ${response.body}');

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        Get.snackbar(
          'Ops!',
          'No Data Found',
          backgroundColor: Colors.red.withOpacity(.2),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}
