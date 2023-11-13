import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;
  RxList images = [].obs;
  @override
  void onInit() {
    getAllBanner();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllBanner() async {
    _isLoading.value = true;

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('banners').get();
    images.addAll(snapshot.docs.map((e) => e.data()).toList());
    // get().then(
    // (value) =>images.value = value.docs
    // .map((e) => ProductModel.fromJson(doc: e.id, json: e.data()))
    // .toList()
    // );
    _isLoading.value = false;
    print("ProductList=>$images");
  }
}
