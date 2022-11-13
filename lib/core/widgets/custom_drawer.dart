import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/settings/size_config.dart';

import '../controllers/drawer_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  final padding = const EdgeInsets.all(20);
  @override
  Widget build(BuildContext context) {
    CustDrawerController drawerController = Get.put(CustDrawerController());
    SizeConfig().ini(context);
    return Drawer(
      child: Material(
        color: AppColor.kGreenButtColor,
        child: ListView(
          padding: padding,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * .05,
            ),
            MenuItem(
              text: 'Home',
              icon: Icons.home,
              onTap: () => drawerController.navToHome(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * .025,
            ),
            MenuItem(
              text: 'Client',
              icon: Icons.people,
              onTap: () => drawerController.navToClient(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * .025,
            ),
            MenuItem(
              text: 'Products',
              icon: Icons.category,
              onTap: () => drawerController.navToProduct(),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * .025,
            ),
            const Divider(
              color: Colors.white70,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * .025,
            ),
            MenuItem(
              text: 'Disconnect',
              icon: Icons.logout,
              onTap: () => drawerController.signout(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColor.kWhiteColor,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
