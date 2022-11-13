import 'package:flutter/material.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_button.dart';
import 'package:product_manager/core/widgets/custom_text_field.dart';

showAddPaymAlert(BuildContext context, Function()? onTap) {
  SizeConfig().ini(context);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("New Payment "),
        actions: [
          CustomGeneralButton(
            text: 'valid',
            width: SizeConfig.screenWidth! * .25,
            height: SizeConfig.screenHeight! * .05,
            onTap: onTap,
          ),
        ],
        content: const SizedBox(
          height: 50,
          child: Form(
            child: CustomTextField(
              inputType: TextInputType.number,
              hintText: 'amount',
              obscureText: false,
              prefixIcon: Icons.payments_outlined,
            ),
          ),
        ),
      );
    },
  );
}
