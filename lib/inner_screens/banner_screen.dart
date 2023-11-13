import 'package:belin_zayy_admin/controllerss/banner_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get/routes.dart';

class BannerPage extends GetView<BannerController> {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.images.isEmpty
                ? const Center(
                    child: Text("No Banner"),
                  )
                : ListView.builder(
                    itemCount: controller.images.length,
                    itemBuilder: ((context, index) => Container(
                          width: Get.size.width,
                          height: Get.size.height / 4,
                          color: Colors.red,
                          child: CachedNetworkImage(
                              imageUrl: controller.images[index]),
                        ))),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.addBanner);
          },
          child: const Icon(Icons.add)),
    );
  }
}
