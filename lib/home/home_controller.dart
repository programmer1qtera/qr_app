import 'package:app_qr/login/login_view.dart';
import 'package:app_qr/model/package_model.dart';
import 'package:app_qr/model/user_model.dart';
import 'package:app_qr/services/package_services.dart';
import 'package:app_qr/services/user.servoces.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  @override
  void onInit() async {
    await getUser();
    await getPackage();
    super.onInit();
  }

  UserModel? get resultUser => _userMod;
  UserModel? _userMod;

  PackageModel? get resultPackage => _packageMod;
  PackageModel? _packageMod;

  Future<dynamic> getUser() async {
    isLoading = true;
    update();
    try {
      var getDataUser = await UserServices.userServices();
      if (getDataUser == null) {
        Get.offAll(LoginView());
        final box = GetStorage();
        box.erase();
        isLoading = false;
        update();
      } else {
        _userMod = getDataUser;
        // print('error data');
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  Future<dynamic> getPackage() async {
    isLoading = true;
    update();
    try {
      var getDataPackage = await PackageServices.packageServices();
      if (getDataPackage != null) {
        _packageMod = getDataPackage;
        isLoading = false;
        update();
      } else {
        print('data kosong');
        isLoading = false;
        update();
      }
    } catch (e) {
      print(e);
      isLoading = false;
      update();
    }
  }
}
