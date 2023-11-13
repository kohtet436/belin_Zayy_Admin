import 'dart:io';
import 'package:belin_zayy_admin/controllerss/all_products_controller.dart';
import 'package:belin_zayy_admin/get/routes.dart';
import 'package:belin_zayy_admin/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../services/global_method.dart';

class EditProductController extends GetxController {
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  RxString pickedImage = ''.obs;
  // get pickedImage => _pickedImage.value;
  GlobalKey<FormState>? formkey = GlobalKey<FormState>();
  AllProductCotroller allProductCotroller = Get.find<AllProductCotroller>();
  final _titleCotroller = TextEditingController().obs;
  TextEditingController get titleController => _titleCotroller.value;
  set titleController(val) => _titleCotroller.value = val;
  final _priceController = TextEditingController().obs;
  TextEditingController get priceController => _priceController.value;
  set priceController(val) => _priceController.value = val;
  FocusNode titleFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();
  final textFieldKey1 = GlobalKey<FormFieldState>();
  final textFieldKey2 = GlobalKey<FormFieldState>();
  ProductModel findProductByID(String productID) =>
      allProductCotroller.productList.firstWhere((e) => e.id == productID);
  Future<void> pickImage() async {
    // MOBILE
    // if (!kIsWeb) {
    // final ImagePicker _picker = ImagePicker();
    print("do fun");
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(image);
    if (image != null) {
      // var selected = File(image.path);

      pickedImage.value = image.path;
      print("pickedImage=>${pickedImage.value}");
    } else {
      // log('No file selected');
      // showToast("No file selected");
    }
    // update(['update']);
    // }
    // WEB
    // else if (kIsWeb) {
    //   final ImagePicker _picker = ImagePicker();
    //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //   if (image != null) {
    //     var f = await image.readAsBytes();
    //     setState(() {
    //       _pickedImage = File("a");
    //       webImage = f;
    //     });
    //   } else {
    //     // log('No file selected');
    //   }
    // } else {
    //   // log('Perm not granted');
    // }
  }

  @override
  void onInit() {
    print("init do");
    pickedImage.value = '';
    // TODO: implement onInit
    super.onInit();
  }

  AllProductCotroller allProductController = Get.find();
  void updateProduct(
      TextEditingController titleController,
      TextEditingController priceController,
      String id,
      String initialImage) async {
    var isValid = formkey?.currentState?.validate();
    // FocusScope.of(context).unfocus();

    if (isValid!) {
      // _formKey.currentState!.save();

      try {
        String? imageUri;
        _isLoading.value = true;
        if (pickedImage.value != '') {
          var storageRef = FirebaseStorage.instance
              .ref()
              .child('productsImages')
              .child('${id}jpg');
          // var imageUri = storageRef.getDownloadURL();

          //  uploadTaskSnapshot =await storageRef.put( pickedImage).future;
          UploadTask uploadTaskSnapshot =
              storageRef.putFile(File(pickedImage.toString()));
// uploadTaskSnapshot.storageRef.getDownloadURL();
          imageUri = await (await uploadTaskSnapshot).ref.getDownloadURL();
        }
        await FirebaseFirestore.instance.collection('products').doc(id).update({
          'title': titleController.text,
          'price': priceController.text,
          // 'salePrice': _salePrice,
          'imageUrl':
              pickedImage.value == '' ? initialImage : imageUri.toString(),
          // 'productCategoryName': _catValue,
          // // 'isOnSale': _isOnSale,
          // 'isPiece': _isPiece,
        });
        await Fluttertoast.showToast(
          msg: "Product has been updated",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
          subtitle: '${error.message}',
        );
        _isLoading.value = false;
      } catch (error) {
        GlobalMethods.errorDialog(
          subtitle: '$error',
        );
        _isLoading.value = false;
      } finally {
        _isLoading.value = false;
        // Get.toNamed(Routes.allProducts);
        Get.offNamed(Routes.allProducts);
        // allProductController.getAllProduct();
        // pickedImage.value = '';
      }
    }
  }

  @override
  void dispose() {
    formkey = null;
    formkey = GlobalKey<FormState>();
    titleController = TextEditingController();
    priceController = TextEditingController();
    pickedImage.value = '';
    print("do dispose");
    // TODO: implement dispose
    super.dispose();
  }

  // @override
  // void onInit() {
//     debounce(titleCotroller, (_) {
//       print("titledebouce$_");
//     }, time: Duration(seconds: 1));
//     debounce(priceController, (_) {
//       print("pricedebouce$_");
//     }, time: Duration(seconds: 1));
//     print("pickedimage=>${pickedImage.value}");
//     print("picked image=>${pickedImage.runtimeType}");
//     // TODO: implement onInit
//     super.onInit();
//   }
}
