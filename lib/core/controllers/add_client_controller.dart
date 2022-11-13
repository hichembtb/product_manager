import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/utils/show_loading.dart';

class AddClientController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late String name;
  late String surname;
  late double quantity;
  late double totalprice;
  late double productPrice;
  // ! add and remove quantity given to client
  addQty() {
    quantity++;
    totalprice = quantity * productPrice;
    update();
  }

  removeQty() {
    if (!(quantity <= 0)) {
      quantity--;
      totalprice = quantity * productPrice;
      update();
    }
  }

// ? Add New Client to Firebase
  Future addClient(BuildContext context) async {
    FormState? formdata = formstate.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();
        showLoading(context);
        CollectionReference clientRef =
            FirebaseFirestore.instance.collection('client');
        clientRef.add({
          'name': name,
          'surname': surname,
          'credit': totalprice,
          'added_date': DateTime.now(),
          'payment': [],
          'refId': '',
        }).whenComplete(() => Get.back());
      }
    }
  }

  @override
  void onInit() {
    totalprice = 0;
    quantity = 0;
    productPrice = 200;
    super.onInit();
  }
}
