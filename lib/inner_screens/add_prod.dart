import 'dart:io';

import 'package:belin_zayy_admin/get/color_manager.dart';
import 'package:belin_zayy_admin/values/value_manager.dart';
import 'package:belin_zayy_admin/values/widget_util.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:belin_zayy_admin/screens/loading_manager.dart';
import 'package:belin_zayy_admin/widgets/buttons.dart';
import 'package:belin_zayy_admin/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllerss/upload_product_controller.dart';

class UploadProductFormScreen extends GetView<UploadProductController> {
  const UploadProductFormScreen({Key? key}) : super(key: key);

  // Uint8List webImage = Uint8List(8);

  // @override
  // void dispose() {
  //   if (mounted) {
  //     _priceController.dispose();
  //     _titleController.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    // final color = Colors.blue;
    //  Utils(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    // Size size = Utils(context).getScreenSize;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          // color: color,
          width: 1.0,
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Add Product Page"),
          ),
          // key: context.read<MenuControllerProvider>().getAddProductscaffoldKey,
          // drawer: const SideMenu(),
          body: Obx(
            () => Form(
              key: controller.formKey,
              child: ListView(
                padding: WidgetUtil.defaultAllPadding(),
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
                          controller.pickImage();
                        },
                        child: controller.pickedImage == ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                      child: const Text("Clear upload image")),
                  const Text("Product Title"),
                  TextFormField(
                    onEditingComplete: () {
                      controller.priceFocusNode.requestFocus();
                    },
                    controller: controller.titleController,
                    decoration: const InputDecoration(
                        isDense: true, border: OutlineInputBorder()),
                  ),
                  const Text("Price"),
                  TextFormField(
                    focusNode: controller.priceFocusNode,
                    controller: controller.priceController,
                    decoration: const InputDecoration(
                        isDense: true, border: OutlineInputBorder()),
                  ),
                  const Text("Select Category"),
                  DropdownButtonFormField(
                      value: controller.catValue,
                      decoration: const InputDecoration(
                          isDense: true, border: OutlineInputBorder()),
                      items: [
                        DropdownMenuItem(
                          value: "Men",
                          onTap: () {
                            controller.catValue = "Men";
                          },
                          child: const Text("Men"),
                        ),
                        DropdownMenuItem(
                          value: "Women",
                          onTap: () {
                            controller.catValue = "Women";
                          },
                          child: const Text("Women"),
                        ),
                        DropdownMenuItem(
                          value: "Kids",
                          onTap: () {
                            controller.catValue = "Kids";
                          },
                          child: const Text("Kids"),
                        ),
                        DropdownMenuItem(
                          value: "Beverage",
                          onTap: () {
                            controller.catValue = "Beverage";
                          },
                          child: const Text("Beverage"),
                        ),
                        DropdownMenuItem(
                          value: "Food",
                          onTap: () {
                            controller.catValue = "Food";
                          },
                          child: const Text("Food"),
                        ),
                        DropdownMenuItem(
                          value: "Cosmetic",
                          onTap: () {
                            controller.catValue = "Cosmetic";
                          },
                          child: const Text("Cosmetic"),
                        ),
                      ],
                      onChanged: (e) {
                        controller.catValue = e;
                      }),
                  // DropdownButtonHideUnderline(
                  //     child: DropdownButton(
                  //         hint: const Text("Select Category"),
                  //         items: [
                  //           DropdownMenuItem(
                  //             value: "Men",
                  //             onTap: () {},
                  //             child: const Text("Men"),
                  //           ),
                  //           DropdownMenuItem(
                  //             value: "Women",
                  //             onTap: () {},
                  //             child: const Text("Men"),
                  //           ),
                  //           DropdownMenuItem(
                  //             value: "Men",
                  //             onTap: () {},
                  //             child: const Text("Men"),
                  //           ),
                  //           DropdownMenuItem(
                  //             value: "Men",
                  //             onTap: () {},
                  //             child: const Text("Men"),
                  //           ),
                  //         ],
                  //         onChanged: (e) {})),
                  WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            controller.clearForm();
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.dangerous),
                              Text("Clear Form")
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            controller.uploadForm();
                          },
                          child: controller.isLoading == true
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                )
                              : Row(
                                  children: const [
                                    Icon(Icons.upload),
                                    Text("Upload Form")
                                  ],
                                )),
                    ],
                  )
                ],
              ),
            ),
          )
          // LoadingManager(
          //   isLoading: controller.isLoading,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // if (Responsive.isDesktop(context))
          //       //   const Expanded(
          //       //     child: SideMenu(),
          //       //   ),
          //       Expanded(
          //         flex: 5,
          //         child: SingleChildScrollView(
          //           child: Column(
          //             children: [
          //               const SizedBox(
          //                 height: 25,
          //               ),
          //               // Padding(
          //               //   padding: const EdgeInsets.all(8.0),
          //               //   child: Header(
          //               //       fct: () {
          //               //         context
          //               //             .read<MenuControllerProvider>()
          //               //             .controlAddProductsMenu();
          //               //       },
          //               //       title: 'Add product',
          //               //       showTexField: false),
          //               // ),
          //               const SizedBox(
          //                 height: 25,
          //               ),
          //               Container(
          //                 // width: size.width > 650 ? 650 : size.width,
          //                 color: Theme.of(context).cardColor,
          //                 padding: const EdgeInsets.all(16),
          //                 margin: const EdgeInsets.all(16),
          //                 child: Form(
          //                   key: controller.formKey,
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: <Widget>[
          //                       TextWidget(
          //                         text: 'Product title*',
          //                         color: color,
          //                         isTitle: true,
          //                       ),
          //                       const SizedBox(
          //                         height: 10,
          //                       ),
          //                       TextFormField(
          //                         controller: controller.titleController,
          //                         key: const ValueKey('Title'),
          //                         validator: (value) {
          //                           if (value!.isEmpty) {
          //                             return 'Please enter a Title';
          //                           }
          //                           return null;
          //                         },
          //                         decoration: inputDecoration,
          //                       ),
          //                       const SizedBox(
          //                         height: 20,
          //                       ),
          //                       Row(
          //                         children: [
          //                           Expanded(
          //                             flex: 2,
          //                             child: FittedBox(
          //                               child: Column(
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.start,
          //                                 children: [
          //                                   TextWidget(
          //                                     text: 'Price in \$*',
          //                                     color: color,
          //                                     isTitle: true,
          //                                   ),
          //                                   const SizedBox(
          //                                     height: 10,
          //                                   ),
          //                                   SizedBox(
          //                                     width: 100,
          //                                     child: TextFormField(
          //                                       controller:
          //                                           controller.priceController,
          //                                       key: const ValueKey('Price \$'),
          //                                       keyboardType: TextInputType.number,
          //                                       validator: (value) {
          //                                         if (value!.isEmpty) {
          //                                           return 'Price is missed';
          //                                         }
          //                                         return null;
          //                                       },
          //                                       inputFormatters: <
          //                                           TextInputFormatter>[
          //                                         FilteringTextInputFormatter.allow(
          //                                             RegExp(r'[0-9.]')),
          //                                       ],
          //                                       decoration: inputDecoration,
          //                                     ),
          //                                   ),
          //                                   const SizedBox(height: 20),
          //                                   TextWidget(
          //                                     text: 'Porduct category*',
          //                                     color: color,
          //                                     isTitle: true,
          //                                   ),
          //                                   const SizedBox(height: 10),
          //                                   // Drop down menu code here
          //                                   _categoryDropDown(),

          //                                   const SizedBox(
          //                                     height: 20,
          //                                   ),
          //                                   TextWidget(
          //                                     text: 'Measure unit*',
          //                                     color: color,
          //                                     isTitle: true,
          //                                   ),
          //                                   const SizedBox(
          //                                     height: 10,
          //                                   ),
          //                                   // Radio button code here
          //                                   Row(
          //                                     children: [
          //                                       TextWidget(
          //                                         text: 'KG',
          //                                         color: color,
          //                                       ),
          //                                       Radio(
          //                                         value: 1,
          //                                         groupValue: controller.groupValue,
          //                                         onChanged: (valuee) {
          //                                           controller.groupValue = 1;
          //                                           controller.isPiece = false;
          //                                         },
          //                                         activeColor: Colors.green,
          //                                       ),
          //                                       TextWidget(
          //                                         text: 'Piece',
          //                                         color: color,
          //                                       ),
          //                                       Radio(
          //                                         value: 2,
          //                                         groupValue: controller.groupValue,
          //                                         onChanged: (valuee) {
          //                                           controller.groupValue = 2;
          //                                           controller.isPiece = true;
          //                                         },
          //                                         activeColor: Colors.green,
          //                                       ),
          //                                     ],
          //                                   )
          //                                 ],
          //                               ),
          //                             ),
          //                           ),
          //                           // Image to be picked code is here
          //                           Expanded(
          //                             flex: 4,
          //                             child: Padding(
          //                               padding: const EdgeInsets.all(8.0),
          //                               child: Container(
          //                                   // height: size.width > 650
          //                                   // ? 350
          //                                   // :
          //                                   // size.width * 0.45,
          //                                   decoration: BoxDecoration(
          //                                     color: Theme.of(context)
          //                                         .scaffoldBackgroundColor,
          //                                     borderRadius:
          //                                         BorderRadius.circular(12.0),
          //                                   ),
          //                                   child: controller.pickedImage == null
          //                                       ? dottedBorder(color: color)
          //                                       : ClipRRect(
          //                                           borderRadius:
          //                                               BorderRadius.circular(12),
          //                                           child:
          //                                               //  kIsWeb
          //                                               // ? Image.memory(webImage,
          //                                               // fit: BoxFit.fill)
          //                                               // :
          //                                               Image.file(
          //                                                   controller.pickedImage!,
          //                                                   fit: BoxFit.fill),
          //                                         )),
          //                             ),
          //                           ),
          //                           Expanded(
          //                               flex: 1,
          //                               child: FittedBox(
          //                                 child: Column(
          //                                   children: [
          //                                     TextButton(
          //                                       onPressed: () {
          //                                         controller.pickedImage = null;
          //                                         // webImage = Uint8List(8);
          //                                       },
          //                                       child: TextWidget(
          //                                         text: 'Clear',
          //                                         color: Colors.red,
          //                                       ),
          //                                     ),
          //                                     TextButton(
          //                                       onPressed: () {},
          //                                       child: TextWidget(
          //                                         text: 'Update image',
          //                                         color: Colors.blue,
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               )),
          //                         ],
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.all(18.0),
          //                         child: Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceAround,
          //                           children: [
          //                             ButtonsWidget(
          //                               onPressed: controller.clearForm,
          //                               text: 'Clear form',
          //                               icon: IconlyBold.danger,
          //                               backgroundColor: Colors.red.shade300,
          //                             ),
          //                             ButtonsWidget(
          //                               onPressed: () {
          //                                 controller.uploadForm();
          //                               },
          //                               text: 'Upload',
          //                               icon: IconlyBold.upload,
          //                               backgroundColor: Colors.blue,
          //                             ),
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }

  Widget dottedBorder({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      controller.pickImage();
                    }),
                    child: TextWidget(
                      text: 'Choose an image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget _categoryDropDown() {
    return Container(
      color: Colors.white,
      // Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          style: TextStyle(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          value: controller.catValue,
          onChanged: (value) {
            controller.catValue = value!;
          },
          hint: const Text('Select a category'),
          items: const [
            DropdownMenuItem(
              value: 'Vegetables',
              child: Text(
                'Vegetables',
              ),
            ),
            DropdownMenuItem(
              value: 'Fruits',
              child: Text(
                'Fruits',
              ),
            ),
            DropdownMenuItem(
              value: 'Grains',
              child: Text(
                'Grains',
              ),
            ),
            DropdownMenuItem(
              value: 'Nuts',
              child: Text(
                'Nuts',
              ),
            ),
            DropdownMenuItem(
              child: Text(
                'Herbs',
              ),
              value: 'Herbs',
            ),
            DropdownMenuItem(
              child: Text(
                'Spices',
              ),
              value: 'Spices',
            )
          ],
        )),
      ),
    );
  }
}
