import 'package:get/get.dart';
import 'package:product_manager/core/constants/routes/app_routes.dart';

class WelcomeScreenController extends GetxController {
  // ! Navigate to Login Screen
  navToLog() {
    Get.offAllNamed(AppRoute.login);
  }
}
