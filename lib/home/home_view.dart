import 'package:app_qr/home/home_controller.dart';
import 'package:app_qr/home/widget/item_package.dart';
import 'package:app_qr/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [
        InkWell(
            onTap: () {
              final box = GetStorage();
              box.erase();
              Get.offAll(LoginView());
            },
            child: Icon(Icons.logout))
      ]),
      body: GetBuilder<HomeController>(builder: (c) {
        return c.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    c.resultUser?.name == null
                                        ? '-'
                                        : '${c.resultUser?.name}',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Text('${c.resultUser?.role}')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (controller.resultUser?.role == 'admin')
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Icon(Icons.add)),
                        ),
                      Text(
                        'List Of Package',
                        style: TextStyle(fontSize: 26),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      controller.resultPackage?.data == null ||
                              controller.resultPackage?.data.length == 0
                          ? Text('Data Kosong')
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.resultPackage?.data.length,
                              itemBuilder: (context, index) {
                                var itemData =
                                    controller.resultPackage?.data[index];
                                return ItemPackage(
                                  getItemData: itemData,
                                );
                              },
                            )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
