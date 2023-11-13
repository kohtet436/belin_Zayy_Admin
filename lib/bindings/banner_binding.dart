import 'package:belin_zayy_admin/controllerss/banner_controller.dart';
import 'package:get/get.dart';

class BannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BannerController());
    // TODO: implement dependencies
  }
}
