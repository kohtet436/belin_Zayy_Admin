import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class AllProductCotroller extends GetxController {
  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  get productList => _productList;
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  Future<void> getAllProduct() async {
    _isLoading.value = true;
    await FirebaseFirestore.instance.collection('products').get().then(
        (value) => _productList.value = value.docs
            .map((e) => ProductModel.fromJson(doc: e.id, json: e.data()))
            .toList());
    _isLoading.value = false;
    print("ProductList=>${_productList.value}");
  }

  @override
  void onInit() {
    print("oninit do");
    getAllProduct();
    // TODO: implement onInit
    super.onInit();
  }

  void deleteProduct(imageUrl, id) {
    print("imageurl=>$imageUrl");
    if (imageUrl != "Instance of 'Future<String>'" &&
        imageUrl != "Instance of '_Future<String>'") {
      Reference strorageReference =
          FirebaseStorage.instance.refFromURL(imageUrl);
      print(
          "testing=>${strorageReference.fullPath.startsWith('productsImages/') == true}");
      if (strorageReference.fullPath.startsWith('productsImages/') == true) {
        strorageReference.delete();
        FirebaseFirestore.instance.collection('products').doc(id).delete();
      } else {
        Get.dialog(Text("delet to admin"));
      }
      print("url=>${strorageReference.fullPath}");
      // DocumentReference documentReference =
      getAllProduct();
    }
    Get.dialog(AlertDialog(
      title: Text(
          "You can not delete because something.Developer can only delete"),
    ));
    print("error");
  }
  // print("doc$documentReference");
}
