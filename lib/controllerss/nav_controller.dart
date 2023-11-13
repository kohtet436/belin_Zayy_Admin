import 'package:get/get.dart';

enum AllPage { main, orders, products, banner }

class NavController extends GetxController {
  final Rx<AllPage> _initAllPage = AllPage.main.obs;
  get initAllPage => _initAllPage.value;
  set initAllPage(val) => _initAllPage.value = val;
  void change(AllPage allPage) {
    Get.back();
    _initAllPage.value = allPage;
  }
}
