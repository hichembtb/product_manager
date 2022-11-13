import 'package:flutter/material.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import '../settings/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        width: width ?? SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.kGreenButtColor,
              AppColor.ksoftGreen,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
