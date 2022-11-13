import 'package:get/get.dart';
import 'package:product_manager/view/auth/screens/login_screen.dart';
import 'package:product_manager/view/home/crud/add_client_screen.dart';
import 'package:product_manager/view/home/crud/edit_client_screen.dart';
import 'package:product_manager/view/home/crud/clients_screen.dart';
import 'package:product_manager/view/home/product_screen.dart';

import '../../../view/home/home_page_screen.dart';
import 'app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  // ! Crud
  GetPage(
    name: AppRoute.addclient,
    page: () => const AddClientScreen(),
  ),
  GetPage(
    name: AppRoute.editclient,
    page: () => const EditClientScrenn(),
  ),
  GetPage(
    name: AppRoute.clientscreen,
    page: () => const ClientsScreen(),
  ),
  // ? AUTH
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
  // ! Home
  GetPage(
    name: AppRoute.homepage,
    page: () => const HomePageScreen(),
  ),
  GetPage(
    name: AppRoute.product,
    page: () => const ProductScreen(),
  ),
];
