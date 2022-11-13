import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/routes/app_routes.dart';

class CustDrawerController extends GetxController {
  // ! Navigation to Home page
  navToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }

  // ! Navigation to Client page
  navToClient() {
    Get.offAllNamed(AppRoute.clientscreen);
  }

  // ! Navigation to Products page
  navToProduct() {
    Get.offAllNamed(AppRoute.product);
  }

  // ? Signout
  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.delete<CustDrawerController>();
    Get.offAllNamed(AppRoute.login);
  }
}
