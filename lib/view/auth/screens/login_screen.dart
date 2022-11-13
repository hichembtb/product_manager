import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/controllers/login_screen_controller.dart';
import 'package:product_manager/core/functions/validator.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_auth_textField.dart';
import 'package:product_manager/core/widgets/custom_button.dart';
import '../../../core/constants/images/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    SizeConfig().ini(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: AppColor.kWhiteColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage(
                    kSafiorLogo,
                  ),
                  height: SizeConfig.screenHeight! * .25,
                ),
                Text(
                  'Product Manager',
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .03,
                ),
                Form(
                  key: loginScreenController.formstate,
                  child: Column(
                    children: [
                      CustomAuthTextField(
                        requireText: "Your Email Address",
                        hintText: 'exemple@mail.com',
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        icon: Icons.email,
                        onSaved: (value) =>
                            loginScreenController.userEmail = value!,
                        validator: (value) {
                          return validator(value!, 5, 50, 'email');
                        },
                      ),
                      CustomAuthTextField(
                        requireText: "Your Password",
                        hintText: 'min , 8 characters',
                        inputType: TextInputType.name,
                        obscureText: true,
                        icon: Icons.email,
                        onSaved: (value) =>
                            loginScreenController.userPassword = value!,
                        validator: (value) {
                          return validator(value!, 5, 20, 'password');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .15,
                ),
                CustomGeneralButton(
                  text: "Login",
                  width: SizeConfig.screenWidth! * 0.5,
                  height: SizeConfig.screenHeight! * 0.05,
                  onTap: () {
                    loginScreenController.loginAndNavigate(context);
                  },
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
