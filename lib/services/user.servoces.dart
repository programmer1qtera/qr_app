import 'dart:convert';
import 'package:app_qr/login/login_view.dart';
import 'package:app_qr/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<UserModel?> userServices() async {
    final box = GetStorage();
    var userLog = await box.read('userData');
    print(userLog);
    var getToken = userLog['token'];
    print(getToken);
    try {
      final url = Uri.parse('http://192.168.88.25:3021/api/user/id');
      final response = await http.get(url, headers: {"tokens": getToken});
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final dataIn = jsonDecode(response.body);

        print(dataIn['userGet']);
        return UserModel.fromJson(dataIn['userGet']);
      } else {
        Get.offAll(LoginView());
        box.erase();
        return null;
      }
    } catch (e) {
      Get.offAll(LoginView());
      box.erase();
      throw Exception(e);
    }
  }
}
