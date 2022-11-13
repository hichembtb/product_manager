import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/constants/images/app_images.dart';
import 'package:product_manager/core/controllers/welcome_screen_controller.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeScreenController welcomeScreenController =
        Get.put(WelcomeScreenController());
    SizeConfig().ini(context);
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1.62),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight! / 1.80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        kBacoSol,
                      ).image,
                    ),
                    color: AppColor.kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(125),
                      bottomRight: Radius.circular(125),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 1.3),
                    child: CircleAvatar(
                      radius: SizeConfig.defaultSize! * 5.6,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          kSafior,
                        ),
                        radius: SizeConfig.defaultSize! * 5.5,
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0, 0.4),
                child: SelectionArea(
                  child: Text(
                    'Sarl Safior Product Manager',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0.85),
                child: CustomGeneralButton(
                  text: 'Continue',
                  width: SizeConfig.screenWidth! / 2,
                  onTap: () {
                    welcomeScreenController.navToLog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
