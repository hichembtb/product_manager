import 'package:flutter/material.dart';

import '../constants/color/app_color.dart';

showLoading(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        backgroundColor: AppColor.kAppBarColor,
        title: Text("  please wait"),
        content: SizedBox(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
