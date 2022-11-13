import 'package:flutter/material.dart';
import '../constants/color/app_color.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.fillColor,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 100, height: 40),
      fillColor: fillColor ?? AppColor.kAppBarColor,
      splashColor: AppColor.kSplashColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Icon(
        icon ?? Icons.add,
        color: AppColor.kWhiteColor,
      ),
    );
  }
}
