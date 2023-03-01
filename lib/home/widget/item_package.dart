import 'package:app_qr/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ItemPackage extends StatelessWidget {
  ItemModelPackage? getItemData;
  ItemPackage({required this.getItemData, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            QrImage(
                backgroundColor: Colors.white,
                size: 80,
                data: '${getItemData?.id}'),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${getItemData?.name}'),
                SizedBox(
                  height: 10,
                ),
                Text('${getItemData?.quantity}'),
                SizedBox(
                  height: 10,
                ),
                Text('${getItemData?.createBy}'),
                Text('${getItemData?.createAt}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
