import 'package:belin_zayy_admin/controllerss/all_products_controller.dart';
import 'package:get/get.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllProductCotroller());
    // TODO: implement dependencies
  }
}
