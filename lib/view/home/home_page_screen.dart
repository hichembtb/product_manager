import 'package:flutter/material.dart';
import 'package:product_manager/core/constants/images/app_images.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_drawer.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text('SARL Safior Delivery '),
            ),
            drawer: const CustomDrawer(),
            body: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    kWelcome,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
