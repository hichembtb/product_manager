import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/constants/routes/app_pages_routes.dart';
import 'package:product_manager/view/auth/screens/welcome_screen.dart';
import 'package:product_manager/view/home/crud/clients_screen.dart';

//
late bool isLoged;
//
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.kWhiteColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? userLoged = FirebaseAuth.instance.currentUser;
  userLoged == null ? isLoged = false : isLoged = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoged == true ? const ClientsScreen() : const WelcomeScreen(),
      getPages: getPages,
    );
  }
}
