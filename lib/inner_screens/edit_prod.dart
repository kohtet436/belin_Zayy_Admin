import 'dart:io';
import 'package:belin_zayy_admin/controllerss/edit_product_controller.dart';
import 'package:belin_zayy_admin/models/product_model.dart';
import 'package:belin_zayy_admin/values/widget_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductScreen extends StatelessWidget {
  final String? title, imageUrl;
  final String? id;
  final double? price;
  EditProductScreen({
    super.key,
    this.title,
    this.price,
    this.id,
    // required this.salePrice,
    // required this.productCat,
    this.imageUrl,
    // required this.isOnSale,
    // required this.isPiece
  });
  EditProductController controller = Get.put(EditProductController());

  // title, price, productCat, imageUrl;
  // final bool isPiece;
  // isOnSale;
  // final double salePrice;

  // String dropDownValue = 'one';
  // final _formKey = GlobalKey<FormState>();
  // Title and price controllers
  // late final TextEditingController _titleController, _priceController;
  // Category
  // late String _catValue;
  // Sale
  // String? _salePercent;
  // late String percToShow;
  // late double _salePrice;
  // late bool _isOnSale;
  // Image
  // File? _pickedImage;
  // Uint8List webImage = Uint8List(10);
  // late String _imageUrl;
  // // kg or Piece,
  // late int val;
  // late bool _isPiece;
  // // while loading
  // bool _isLoading = false;
  // @override
  // void initState() {
  //   // set the price and title initial values and initialize the controllers
  //   _priceController = TextEditingController(text: widget.price);
  //   _titleController = TextEditingController(text: widget.title);
  //   // Set the variables
  //   _salePrice = widget.salePrice;
  //   _catValue = widget.productCat;
  //   // _isOnSale = widget.isOnSale;
  //   // _isPiece = widget.isPiece;
  //   // val = _isPiece ? 2 : 1;
  //   _imageUrl = widget.imageUrl;
  //   // Calculate the percentage
  //   percToShow = (100 -
  //               (_salePrice * 100) /
  //                   double.parse(
  //                       widget.price)) // WIll be the price instead of 1.88
  //           .round()
  //           .toStringAsFixed(1) +
  //       '%';
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // Dispose the controllers
  //   _priceController.dispose();
  //   _titleController.dispose();
  //   super.dispose();
  // }

  // void _updateProduct() async {
  //   final isValid = _formKey.currentState!.validate();
  //   FocusScope.of(context).unfocus();

  //   if (isValid) {
  //     _formKey.currentState!.save();

  //     try {
  //       Uri? imageUri;
  //       setState(() {
  //         _isLoading = true;
  //       });
  //       if (_pickedImage != null) {
  //         var storageRef = FirebaseStorage.instance
  //             .ref()
  //             .child('productsImages')
  //             .child(widget.id + 'jpg');
  //         var imageUri = storageRef.getDownloadURL();
  //         //  uploadTaskSnapshot =
  //         // await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
  //         // imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
  //       }
  //       await FirebaseFirestore.instance
  //           .collection('products')
  //           .doc(widget.id)
  //           .update({
  //         'title': _titleController.text,
  //         'price': _priceController.text,
  //         'salePrice': _salePrice,
  //         'imageUrl':
  //             _pickedImage == null ? widget.imageUrl : imageUri.toString(),
  //         'productCategoryName': _catValue,
  //         // 'isOnSale': _isOnSale,
  //         'isPiece': _isPiece,
  //       });
  //       await Fluttertoast.showToast(
  //         msg: "Product has been updated",
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //       );
  //     } on FirebaseException catch (error) {
  //       GlobalMethods.errorDialog(
  //         subtitle: '${error.message}',
  //       );
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     } catch (error) {
  //       GlobalMethods.errorDialog(
  //         subtitle: '$error',
  //       );
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    print("build");
    // final theme = Utils(context).getTheme;
    // true ?
    // Colors.white : Colors.black;
    // final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    // Size size = Utils(context).getScreenSize;
    // String id = Get.arguments.toString();

    // TextEditingController titleController =
    //     TextEditingController(text: current.title);
    // TextEditingController priceController =
    //     TextEditingController(text: current.price);

    // var inputDecoration = InputDecoration(
    //   filled: true,
    //   fillColor: _scaffoldColor,
    //   border: InputBorder.none,
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: color,
    //       width: 1.0,
    //     ),
    //   ),
    // );
    controller.titleController = TextEditingController(text: title);
    controller.priceController = TextEditingController(text: price.toString());
    // ProductModel current = controller.findProductByID(id);
    // controller.titleCotroller.value =
    // TextEditingController(text: current.title.toString());
    // controller.priceController.value =
    // TextEditingController(text: current.price.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      // key: context.read<MenuControllerProvider>().getEditProductscaffoldKey,
      // drawer: const SideMenu(),
      body: Padding(
        padding: WidgetUtil.defaultAllPadding(),
        child:
            // tag: "update",
            Obx(
          () => Form(
            key: controller.formkey,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: Get.size.height * 0.35,
                  // color: Colors.red,
                  width: double.infinity,
                  child: controller.pickedImage.value == ''
                      ?
                      // _pickedImage == null
                      //     ?

                      CachedNetworkImage(
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: imageUrl ??
                              "https://www.vectorstock.com/royalty-free-vector/error-sign-icon-image-vector-16746594",
                          fit: BoxFit.contain,
                        )
                      // Image.network(_imageUrl)
                      : Image.file(
                          File(controller.pickedImage.value.toString()),
                          fit: BoxFit.fill,
                        ),
                ),

                TextButton(
                  child: const Text("Update Image"),
                  onPressed: () {
                    controller.pickImage();
                  },
                ),
                Text(controller.pickedImage.value == ''
                    ? "no"
                    : controller.pickedImage.value),
                const Text("Product Name"),
                TextFormField(
                  controller: controller.titleController,
                  key: controller.textFieldKey1,
                  focusNode: controller.titleFocusNode,
                  // onEditingComplete: () {
                  //   controller.priceFocusNode.requestFocus();
                  // },

                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder()),
                  // controller: controller.titleCotroller.value,
                  // onChanged: (e) {
                  //   controller.titleCotroller.value.text = e;
                  //   print(
                  //       "titleController=>${controller.titleCotroller.value.text}}");
                  // },
                  //  _titleController
                ),
                const Text("Price"),
                TextFormField(
                    key: controller.textFieldKey2,
                    focusNode: controller.priceFocusNode,
                    // onEditingComplete: () {
                    //   controller.updateProduct(
                    //       controller.titleCotroller.value,
                    //       controller.priceController.value,
                    //       id,
                    //       current.imageUrl);
                    // },
                    decoration: const InputDecoration(
                        isDense: true, border: OutlineInputBorder()),
                    // onChanged: (e) {
                    //   controller.priceController.value.text = e;
                    //   print(
                    //       "priceController=>${controller.priceController.value.text}");
                    // },
                    controller: controller.priceController),
                const Text("Categories"),
                // Container(
                //   child: DropdownButtonFormField(
                //       isDense: true,
                //       decoration:const InputDecoration(
                //           isDense: true, border: OutlineInputBorder()),
                //       alignment: Alignment.center,
                //       value: dropDownValue,
                //       items: const [
                //         DropdownMenuItem<String>(
                //             value: "one", child: Text("one")),
                //         DropdownMenuItem<String>(
                //             value: "two", child: Text("two")),
                //         DropdownMenuItem<String>(
                //           value: "three",
                //           child: Text("three"),
                //         )
                //       ],
                //       onChanged: (e) {
                //         setState(() {
                //           dropDownValue = e!;
                //         });
                //       }),
                // ),
                WidgetUtil.spaceVertical(10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      controller.updateProduct(
                          controller.titleController,
                          controller.priceController,
                          id ?? "",
                          controller.pickedImage.value == ''
                              ? imageUrl!
                              : controller.pickedImage.value);
                    },
                    child: controller.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text("Update"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  LoadingManager(
  //   isLoading: _isLoading,
  //   child: SingleChildScrollView(
  //     child: Center(
  //       child: Column(
  //         children: [
  //           // Header(
  //           //   showTexField: false,
  //           //   fct: () {
  //           //     context
  //           //         .read<MenuControllerProvider>()
  //           //         .controlEditProductsMenu();
  //           //   },
  //           //   title: 'Edit this product',
  //           // ),
  //           Container(
  //             width: size.width > 650 ? 650 : size.width,
  //             color: Theme.of(context).cardColor,
  //             padding: const EdgeInsets.all(16),
  //             margin: const EdgeInsets.all(16),
  //             child: Form(
  //               key: _formKey,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   TextWidget(
  //                     text: 'Product title*',
  //                     color: color,
  //                     isTitle: true,
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   TextFormField(
  //                     controller: _titleController,
  //                     key: const ValueKey('Title'),
  //                     validator: (value) {
  //                       if (value!.isEmpty) {
  //                         return 'Please enter a Title';
  //                       }
  //                       return null;
  //                     },
  //                     decoration: inputDecoration,
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         flex: 1,
  //                         child: FittedBox(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               TextWidget(
  //                                 text: 'Price in \$*',
  //                                 color: color,
  //                                 isTitle: true,
  //                               ),
  //                               const SizedBox(
  //                                 height: 10,
  //                               ),
  //                               SizedBox(
  //                                 width: 100,
  //                                 child: TextFormField(
  //                                   controller: _priceController,
  //                                   key: const ValueKey('Price \$'),
  //                                   keyboardType: TextInputType.number,
  //                                   validator: (value) {
  //                                     if (value!.isEmpty) {
  //                                       return 'Price is missed';
  //                                     }
  //                                     return null;
  //                                   },
  //                                   inputFormatters: <TextInputFormatter>[
  //                                     FilteringTextInputFormatter.allow(
  //                                         RegExp(r'[0-9.]')),
  //                                   ],
  //                                   decoration: inputDecoration,
  //                                 ),
  //                               ),
  //                               const SizedBox(height: 20),
  //                               TextWidget(
  //                                 text: 'Porduct category*',
  //                                 color: color,
  //                                 isTitle: true,
  //                               ),
  //                               const SizedBox(height: 10),
  //                               // Container(
  //                               //   color: _scaffoldColor,
  //                               //   child: Padding(
  //                               //     padding: const EdgeInsets.symmetric(
  //                               //         horizontal: 8),
  //                               //     child: catDropDownWidget(color),
  //                               //   ),
  //                               // ),
  //                               const SizedBox(
  //                                 height: 20,
  //                               ),
  //                               TextWidget(
  //                                 text: 'Measure unit*',
  //                                 color: color,
  //                                 isTitle: true,
  //                               ),
  //                               const SizedBox(
  //                                 height: 10,
  //                               ),
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.start,
  //                                 children: [
  //                                   TextWidget(text: 'Kg', color: color),
  //                                   // Radio(
  //                                   //   value: 1,
  //                                   //   groupValue: val,
  //                                   //   onChanged: (value) {
  //                                   //     setState(() {
  //                                   //       val = 1;
  //                                   //       _isPiece = false;
  //                                   //     });
  //                                   //   },
  //                                   //   activeColor: Colors.green,
  //                                   // ),
  //                                   TextWidget(text: 'Piece', color: color),
  //                                   // Radio(
  //                                   //   value: 2,
  //                                   //   groupValue: val,
  //                                   //   onChanged: (value) {
  //                                   //     setState(() {
  //                                   //       val = 2;
  //                                   //       _isPiece = true;
  //                                   //     });
  //                                   //   },
  //                                   //   activeColor: Colors.green,
  //                                   // ),
  //                                 ],
  //                               ),
  //                               const SizedBox(
  //                                 height: 15,
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   // Checkbox(
  //                                   //   value: _isOnSale,
  //                                   //   onChanged: (newValue) {
  //                                   //     setState(() {
  //                                   //       _isOnSale = newValue!;
  //                                   //     });
  //                                   //   },
  //                                   // ),
  //                                   const SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   TextWidget(
  //                                     text: 'Sale',
  //                                     color: color,
  //                                     isTitle: true,
  //                                   ),
  //                                 ],
  //                               ),
  //                               const SizedBox(
  //                                 height: 5,
  //                               ),
  //                               // AnimatedSwitcher(
  //                               //   duration: const Duration(seconds: 1),
  //                               //   child: !_isOnSale
  //                               //       ? Container()
  //                               //       : Row(
  //                               //           children: [
  //                               //             TextWidget(
  //                               //                 text: "\$" +
  //                               //                     _salePrice
  //                               //                         .toStringAsFixed(2),
  //                               //                 color: color),
  //                               //             const SizedBox(
  //                               //               width: 10,
  //                               //             ),
  //                               //             // salePourcentageDropDownWidget(
  //                               //             // color),
  //                               //           ],
  //                               //         ),
  //                               // )
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 3,
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(10),
  //                           child: Container(
  //                             height: size.width > 650
  //                                 ? 350
  //                                 : size.width * 0.45,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(
  //                                 12,
  //                               ),
  //                               color: Theme.of(context)
  //                                   .scaffoldBackgroundColor,
  //                             ),
  //                             child: ClipRRect(
  //                               borderRadius: const BorderRadius.all(
  //                                   Radius.circular(12)),
  //                               child: _pickedImage == null
  //                                   ? Image.network(_imageUrl)
  //                                   : (kIsWeb)
  //                                       ? Image.memory(
  //                                           webImage,
  //                                           fit: BoxFit.fill,
  //                                         )
  //                                       : Image.file(
  //                                           _pickedImage!,
  //                                           fit: BoxFit.fill,
  //                                         ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                           flex: 1,
  //                           child: Column(
  //                             children: [
  //                               FittedBox(
  //                                 child: TextButton(
  //                                   onPressed: () {
  //                                     _pickImage();
  //                                   },
  //                                   child: TextWidget(
  //                                     text: 'Update image',
  //                                     color: Colors.blue,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           )),
  //                     ],
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(18.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         ButtonsWidget(
  //                           onPressed: () async {
  //                             GlobalMethods.warningDialog(
  //                                 title: 'Delete?',
  //                                 subtitle: 'Press okay to confirm',
  //                                 fct: () async {
  //                                   await FirebaseFirestore.instance
  //                                       .collection('products')
  //                                       .doc(widget.id)
  //                                       .delete();
  //                                   await Fluttertoast.showToast(
  //                                     msg: "Product has been deleted",
  //                                     toastLength: Toast.LENGTH_LONG,
  //                                     gravity: ToastGravity.CENTER,
  //                                     timeInSecForIosWeb: 1,
  //                                   );
  //                                   while (Navigator.canPop(context)) {
  //                                     Navigator.pop(context);
  //                                   }
  //                                 },
  //                                 context: context);
  //                           },
  //                           text: 'Delete',
  //                           icon: IconlyBold.danger,
  //                           backgroundColor: Colors.red.shade700,
  //                         ),
  //                         ButtonsWidget(
  //                           onPressed: () {
  //                             _updateProduct();
  //                           },
  //                           text: 'Update',
  //                           icon: IconlyBold.setting,
  //                           backgroundColor: Colors.blue,
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // ),

  // DropdownButtonHideUnderline salePourcentageDropDownWidget(Color color) {
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton<String>(
  //       style: TextStyle(color: color),
  //       items: const [
  //         DropdownMenuItem<String>(
  //           child: Text('10%'),
  //           value: '10',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('15%'),
  //           value: '15',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('25%'),
  //           value: '25',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('50%'),
  //           value: '50',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('75%'),
  //           value: '75',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('0%'),
  //           value: '0',
  //         ),
  //       ],
  //       onChanged: (value) {
  //         if (value == '0') {
  //           return;
  //         } else {
  //           setState(() {
  //             _salePercent = value;
  //             _salePrice = double.parse(widget.price) -
  //                 (double.parse(value!) * double.parse(widget.price) / 100);
  //           });
  //         }
  //       },
  //       hint: Text(_salePercent ?? percToShow),
  //       value: _salePercent,
  //     ),
  //   );
  // }

  // DropdownButtonHideUnderline catDropDownWidget(Color color) {
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton<String>(
  //       style: TextStyle(color: color),
  //       items: const [
  //         DropdownMenuItem<String>(
  //           child: Text('Vegetables'),
  //           value: 'Vegetables',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('Fruits'),
  //           value: 'Fruits',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('Grains'),
  //           value: 'Grains',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('Nuts'),
  //           value: 'Nuts',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('Herbs'),
  //           value: 'Herbs',
  //         ),
  //         DropdownMenuItem<String>(
  //           child: Text('Spices'),
  //           value: 'Spices',
  //         ),
  //       ],
  //       onChanged: (value) {
  //         setState(() {
  //           _catValue = value!;
  //         });
  //       },
  //       hint: const Text('Select a Category'),
  //       value: _catValue,
  //     ),
  //   );
  // }

  // Future<void> _pickImage() async {
  //   // MOBILE
  //   if (!kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  //     if (image != null) {
  //       var selected = File(image.path);

  //       setState(() {
  //         _pickedImage = selected;
  //       });
  //     } else {
  //       // log('No file selected');
  //       // showToast("No file selected");
  //     }
  //   }
  //   // WEB
  //   else if (kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image.readAsBytes();
  //       setState(() {
  //         _pickedImage = File("a");
  //         webImage = f;
  //       });
  //     } else {
  //       // log('No file selected');
  //     }
  //   } else {
  //     // log('Perm not granted');
  //   }
  // }
}
