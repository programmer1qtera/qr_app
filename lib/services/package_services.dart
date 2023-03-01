import 'dart:convert';

import 'package:app_qr/model/package_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PackageServices {
  static Future<PackageModel> packageServices() async {
    final box = GetStorage();
    var userLog = box.read('userData');
    var getToken = userLog['token'];

    final url = Uri.parse('http://192.168.88.25:3021/api/package/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return PackageModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception();
    }
  }
}
