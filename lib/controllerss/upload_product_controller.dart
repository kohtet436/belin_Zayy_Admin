import 'dart:io';

import 'package:belin_zayy_admin/services/global_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadProductController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode priceFocusNode = FocusNode();
  final RxString _catValue = "Men".obs;
  get catValue => _catValue.value;
  set catValue(val) => _catValue.value = val;

  final RxInt _groupValue = 1.obs;
  int get groupValue => _groupValue.value;
  set groupValue(val) => _groupValue.value = val;
  final RxBool _isPiece = false.obs;
  get isPiece => _isPiece.value;
  set isPiece(val) => _isPiece.value = val;
  final RxString _pickedImage = ''.obs;
  get pickedImage => _pickedImage.value;
  set pickedImage(val) => _pickedImage.value = val;
  void uploadForm() async {
    final isValid = formKey.currentState!.validate();
    // FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      if (_pickedImage.value == '') {
        GlobalMethods.errorDialog(
          subtitle: 'Please pick up an image',
        );
        return;
      }
      final _uuid = const Uuid().v4();
      try {
        _isLoading.value = true;
        var storageRef = FirebaseStorage.instance
            .ref()
            .child('productsImages')
            .child('${_uuid}jpg');
        var imageUri = storageRef.getDownloadURL();
        //  uploadTaskSnapshot =
        // await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        // Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('products').doc(_uuid).set({
          'id': _uuid,
          'title': titleController.text,
          'price': priceController.text,
          'salePrice': 0.1,
          'imageUrl': imageUri.toString(),
          'productCategoryName': _catValue.value,
          'isOnSale': false,
          'isPiece': isPiece,
          'createdAt': Timestamp.now(),
        });
        clearForm();
        Fluttertoast.showToast(
          msg: "Product uploaded succefully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: ,
          // textColor: ,
          // fontSize: 16.0
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
      }
    }
  }

  void clearForm() {
    isPiece = false;
    _groupValue.value = 1;
    priceController.clear();
    titleController.clear();

    // _pickedImage.value = null;
    // webImage = Uint8List(8);
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print("image=>$image");
    if (image != null) {
      // var selected = File(image.path);
      _pickedImage.value = image.path;
      print("pickedImage=>${_pickedImage.value}");
    } else {
      print('No image has been picked');
    }
    //  else if (kIsWeb) {
    //   final ImagePicker _picker = ImagePicker();
    //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //   if (image != null) {
    //     var f = await image.readAsBytes();
    //     // setState(() {
    //       // webImage = f;
    //       _pickedImage.value = File('a');
    //     // });
    //   } else {
    //     print('No image has been picked');
    //   }
    // }
    // else {
    // print('Something went wrong');
    // }
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
