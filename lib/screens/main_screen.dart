import 'package:belin_zayy_admin/bindings/all_product_binding.dart';
import 'package:belin_zayy_admin/bindings/banner_binding.dart';
import 'package:belin_zayy_admin/inner_screens/all_orders_screen.dart';
import 'package:belin_zayy_admin/inner_screens/all_products.dart';
import 'package:flutter/material.dart';
import 'package:belin_zayy_admin/widgets/side_menu.dart';
import 'package:get/get.dart';
import '../controllerss/nav_controller.dart';
import '../inner_screens/banner_screen.dart';
import 'dashboard_screen.dart';

class MainScreen extends GetView<NavController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: Obx(() => _getPage(controller.initAllPage)),
    );
  }
}

Widget _getPage(AllPage allPage) {
  switch (allPage) {
    case AllPage.main:
      return const DashboardScreen();
    case AllPage.products:
      AllProductBinding().dependencies();
      return const AllProductsScreen();
    case AllPage.orders:
      return const AllOrdersScreen();
    case AllPage.banner:
      BannerBinding().dependencies();
      return const BannerPage();
    default:
      return const DashboardScreen();
  }
}
