import 'package:get/get.dart';

import '../controllerss/upload_product_controller.dart';

class UploadProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadProductController());
  }
}
