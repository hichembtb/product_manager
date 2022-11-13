import 'package:flutter/material.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/widgets/custom_drawer.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.kAppBarColor,
        title: const Text('Products'),
      ),
    );
  }
}
