import 'package:app_qr/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 26),
            ),
            Text('user login with email and password'),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.passC,
              decoration: InputDecoration(
                  hintText: 'Password', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Row(
                      children: [
                        Text('Login Now'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
