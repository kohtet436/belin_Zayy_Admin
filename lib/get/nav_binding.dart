import 'package:get/get.dart';

import '../controllerss/nav_controller.dart';

class NavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
  }
}
