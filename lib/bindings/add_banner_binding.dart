import 'package:get/get.dart';

import '../controllerss/add_banner_controller.dart';

class AddBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBannerController());
    // TODO: implement dependencies
  }
}
