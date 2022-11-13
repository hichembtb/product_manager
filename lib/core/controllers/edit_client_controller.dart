import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/utils/show_add_payment_alert.dart';

class EditClientController extends GetxController {
  late String name;
  late String surname;
  late double credit;
  @override
  void onInit() {
    name = Get.arguments['name'];
    surname = Get.arguments['surname'];
    credit = Get.arguments['credit'];
    super.onInit();
  }

  // add new payment
  addPayment(BuildContext context) {
    showAddPaymAlert(context, () {
      print('valid new payment');
    });
  }
}
