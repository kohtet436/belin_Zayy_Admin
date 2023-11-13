import 'package:belin_zayy_admin/bindings/edit_product_binding.dart';
import 'package:belin_zayy_admin/controllerss/all_products_controller.dart';
import 'package:belin_zayy_admin/get/color_manager.dart';
import 'package:belin_zayy_admin/inner_screens/edit_prod.dart';
import 'package:belin_zayy_admin/values/font_manager.dart';
import 'package:belin_zayy_admin/values/style_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get/routes.dart';
import '../services/utils.dart';
import 'text_widget.dart';

class ProductWidget extends GetView<AllProductCotroller> {
  ProductWidget({Key? key, required this.index

      // required this.id,
      })
      : super(key: key);
  int index;
  // final String id;
  // String title = '';

  // String productCat = '';

  // String imageUrl;
  // String price = '0.0';

  // double salePrice = 0.0;

  // bool isOnSale = false;

  // bool isPiece = false;

  // @override
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    const color = Colors.blue;
    return InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Get.to(
              () => EditProductScreen(
                    id: controller.productList[index].id.toString(),
                    title: controller.productList[index].title.toString(),
                    price: double.parse(
                        controller.productList[index].price.toString()),
                    imageUrl: controller.productList[index].imageUrl,
                  ),
              binding: EditProductBinding());
          // Get.toNamed(Routes.editProduct,
          //     arguments: controller.productList[index].id);
          // Get.to(EditProductScreen(
          //  controller.productList[index].id,
          // title: controller.productList[index].title,
          // price: controller.productList[index].price,
          // salePrice: controller.productList[index].salePrice,
          // productCat: controller.productList[index].productCategoryName,
          // imageUrl: controller.productList[index].imageUrl,
          // ));
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => EditProductScreen(
          //       id: id,
          //       title: title,
          //       price: price,
          //       salePrice: salePrice,
          //       productCat: productCat,
          //       imageUrl: imageUrl == null
          //           ? 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png'
          //           : imageUrl!,
          //       isOnSale: isOnSale,
          //       isPiece: isPiece,
          //     ),
          //   ),
          // );
        },
        child: Card(
            elevation: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CachedNetworkImage(
                      height: 100,
                      width: 100,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      // imageUrl == null
                      // ? 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png'
                      imageUrl: controller.productList[index].imageUrl),
                  Text(
                    "${controller.productList[index].price.toString()}Ks",
                    style: getLightStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.black),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // color: Colors.blue,
                          width: 130,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            controller.productList[index].title.toString(),
                            style: getRegularStyle(
                                fontSize: FontSize.defaultFontSize,
                                color: ColorManager.primaryColor),
                          ),
                        ),
                        // Icon(Icons.menu)
                        PopupMenuButton(
                            onSelected: (value) {
                              value == 'go'
                                  ? Get.to(
                                      () => EditProductScreen(
                                            id: controller.productList[index].id
                                                .toString(),
                                            title: controller
                                                .productList[index].title
                                                .toString(),
                                            price: double.parse(controller
                                                .productList[index].price
                                                .toString()),
                                            imageUrl: controller
                                                .productList[index].imageUrl,
                                          ),
                                      binding: EditProductBinding())
                                  : controller.deleteProduct(
                                      controller.productList[index].imageUrl,
                                      controller.productList[index].id);
                            },
                            itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'go',
                                    child: Text("Edit"),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text("Delete"),
                                  )
                                ],
                            child: const Icon(Icons.more_vert))
                      ])
                ]))
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Flexible(
        //             flex: 3,
        //             child: CachedNetworkImage(
        //               progressIndicatorBuilder:
        //                   (context, url, downloadProgress) => Center(
        //                 child: CircularProgressIndicator(
        //                     value: downloadProgress.progress),
        //               ),
        //               errorWidget: (context, url, error) =>
        //                   const Icon(Icons.error),
        //               // imageUrl == null
        //               // ? 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png'
        //               imageUrl: controller.productList[index].imageUrl,
        //               fit: BoxFit.fill,
        //               // width: screenWidth * 0.12,
        //               height: size.width * 0.12,
        //             ),
        //           ),
        //           const Spacer(),
        //           PopupMenuButton(
        //               itemBuilder: (context) => [
        //                     PopupMenuItem(
        //                       onTap: () {},
        //                       child: const Text('Edit'),
        //                       value: 1,
        //                     ),
        //                     PopupMenuItem(
        //                       onTap: () {},
        //                       child: const Text(
        //                         'Delete',
        //                         style: TextStyle(color: Colors.red),
        //                       ),
        //                       value: 2,
        //                     ),
        //                   ])
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 2,
        //       ),
        //       Row(
        //         children: [
        //           Text(
        //             controller.productList[index].price,
        //             // isOnSale
        //             // ? '\$${salePrice.toStringAsFixed(2)}'
        //             // : '\$$price',
        //             style: getRegularStyle(
        //                 fontSize: FontSize.defaultFontSize,
        //                 color: Colors.black),
        //           ),
        //           const SizedBox(
        //             width: 7,
        //           ),
        //           // Visibility(
        //           //     visible: isOnSale,
        //           //     child: Text(
        //           //       '\$$price',
        //           //       style: TextStyle(
        //           //           decoration: TextDecoration.lineThrough,
        //           //           color: color),
        //           //     )),
        //           const Spacer(),
        //           // TextWidget(
        //           //   text: isPiece ? 'Piece' : '1Kg',
        //           //   color: color,
        //           //   textSize: 18,
        //           // ),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 2,
        //       ),
        //       TextWidget(
        //         text: controller.productList[index].title,
        //         color: color,
        //         textSize: 20,
        //         isTitle: true,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
