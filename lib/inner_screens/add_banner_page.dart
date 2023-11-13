import 'dart:io';

import 'package:belin_zayy_admin/controllerss/add_banner_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBannerPage extends GetView<AddBannerController> {
  const AddBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: DottedBorder(
                  // borderPadding: EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                width: double.infinity,
                // color: Colors.amber,
                height: Get.size.height / 4,
                child: GestureDetector(
                  onTap: () {
                    controller.pickImageForBanner();
                  },
                  child: controller.pickedImage == ''
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.image_outlined,
                              size: 70,
                            ),
                            Text("choose an image"),
                          ],
                        )
                      : Image.file(
                          File(controller.pickedImage.toString()),
                          fit: BoxFit.contain,
                        ),
                ),
              )),
            ),
            TextButton(
                onPressed: () {
                  controller.pickedImage = '';
                },
                child: const Text("Clear Image")),
            ElevatedButton(
                onPressed: () {
                  controller.addBanner();
                },
                child: controller.isLoading == true
                    ? const Center(child: CircularProgressIndicator())
                    : const Text("Add Banner"))
          ],
        ),
      ),
    );
  }
}
