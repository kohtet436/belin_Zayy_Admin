import 'dart:io';

import 'package:belin_zayy_admin/controllerss/banner_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../get/routes.dart';
import '../services/global_method.dart';

class AddBannerController extends GetxController {
  BannerController bannerController = Get.find<BannerController>();
  final RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;
  final RxString _pickedImage = ''.obs;
  get pickedImage => _pickedImage.value;
  set pickedImage(val) => _pickedImage.value = val;
  Future<void> pickImageForBanner() async {
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
  }

  Future<void> addBanner() async {
    // FocusScope.of(context).unfocus();

    if (_pickedImage.value == '') {
      GlobalMethods.errorDialog(
        subtitle: 'Please pick up an image',
      );
      return;
    }
    try {
      _isLoading.value = true;
      print("start");
      var storageRef = FirebaseStorage.instance
          .ref()
          .child('banner')
          .child('${DateTime.now().millisecondsSinceEpoch.toString()}.jpg');
      print("storage ref=>${storageRef}");
      //  await storageRef.putFile(File(pickedImage));

      UploadTask uploadTask = storageRef.putFile(File(pickedImage));
      await uploadTask.whenComplete(() async {
        var imageUri = await uploadTask.snapshot.ref.getDownloadURL();

        // var imageUri = await storageRef.getDownloadURL();
        print("image=>$imageUri");
        print("end");
        //  uploadTaskSnapshot =
        // await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        // Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('banners').doc().set({
          'imageUrl': imageUri.toString(),
        });
        // clearForm();
        Fluttertoast.showToast(
          msg: "Product uploaded succefully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: ,
          // textColor: ,
          // fontSize: 16.0
        );
        bannerController.getAllBanner();
        Get.toNamed(Routes.banner);
        _isLoading.value = false;
      });
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
