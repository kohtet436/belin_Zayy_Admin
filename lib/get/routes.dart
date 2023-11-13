import 'package:belin_zayy_admin/bindings/edit_product_binding.dart';
import 'package:belin_zayy_admin/inner_screens/add_prod.dart';
import 'package:belin_zayy_admin/inner_screens/all_orders_screen.dart';
import 'package:belin_zayy_admin/inner_screens/all_products.dart';
import 'package:belin_zayy_admin/inner_screens/banner_screen.dart';
import 'package:belin_zayy_admin/inner_screens/edit_prod.dart';
import 'package:belin_zayy_admin/screens/main_screen.dart';
import 'package:get/get.dart';
import '../bindings/add_banner_binding.dart';
import '../bindings/all_product_binding.dart';
import '../bindings/banner_binding.dart';
import '../bindings/upload_product_binding.dart';
import '../inner_screens/add_banner_page.dart';

abstract class Routes {
  static const String mainScreen = '/mainScreen';
  static const String uploadProduct = '/uploadProduct';
  static const String allProducts = '/allProducts';
  static const String allOrders = '/allOrders';
  static const String editProduct = '/editProduct';
  static const String banner = '/banner';
  static const String addBanner = '/addBanner';

  static List<GetPage> pages = [
    GetPage(
        name: Routes.editProduct,
        page: () => EditProductScreen(),
        bindings: [EditProductBinding()]),
    GetPage(name: Routes.allOrders, page: () => const AllOrdersScreen()),
    GetPage(name: Routes.mainScreen, page: () => const MainScreen()),
    GetPage(
        name: Routes.allProducts,
        page: () => const AllProductsScreen(),
        bindings: [AllProductBinding()]),
    GetPage(
        bindings: [UploadProductBinding()],
        name: Routes.uploadProduct,
        page: () => const UploadProductFormScreen()),
    GetPage(
        bindings: [BannerBinding()],
        name: Routes.banner,
        page: () => const BannerPage()),
    GetPage(
        bindings: [AddBannerBinding()],
        name: Routes.addBanner,
        page: () => const AddBannerPage()),
  ];
}
