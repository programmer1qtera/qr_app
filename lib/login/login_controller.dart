import 'dart:convert';

import 'package:app_qr/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool isLoading = true;

  void login() async {
    final url = Uri.parse('http://192.168.88.25:3021/api/user/login');
    final response = await http
        .post(url, body: {"email": emailC.text, "password": passC.text});
    final box = GetStorage();

    if (response.statusCode == 200) {
      print(response.body);
      final dataIn = jsonDecode(response.body);
      print(dataIn['data']['_id']);

      box.write('userData', {
        'id': dataIn['data']['_id'],
        'name': dataIn['data']['name'],
        'role': dataIn['data']['role'],
        'token': dataIn['data']['token'],
      });
      Get.offAll(const HomeView());

      // print(box.read('userData'));
    } else {
      box.erase();
      print('User Tidak di Temukan');
    }
  }
}
