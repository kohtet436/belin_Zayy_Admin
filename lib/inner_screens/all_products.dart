import 'package:belin_zayy_admin/controllerss/all_products_controller.dart';
import 'package:belin_zayy_admin/values/widget_util.dart';
import 'package:belin_zayy_admin/widgets/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/utils.dart';

class AllProductsScreen extends GetView<AllProductCotroller> {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    return Scaffold(
        appBar: AppBar(
          title: Text("All products"),
        ),
        // key: context.read<MenuControllerProvider>().getgridscaffoldKey,
        // drawer: const SideMenu(),
        body: SafeArea(
            child:
                //  Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // We want this side menu only for large screen
                //     // if (Responsive.isDesktop(context))
                //     //   const Expanded(
                //     //     // default flex = 1
                //     //     // and it takes 1/6 part of the screen
                //     //     child: SideMenu(),
                //     //   ),
                //     Expanded(
                //         // It takes 5/6 part of the screen
                //         flex: 5,
                //         child: SingleChildScrollView(
                //           controller: ScrollController(),
                //           child: Column(
                //             children: [
                //               const SizedBox(
                //                 height: 25,
                //               ),
                //               // Header(
                //               //   fct: () {
                //               //     context
                //               //         .read<MenuControllerProvider>()
                //               //         .controlProductsMenu();
                //               //   },
                //               //   title: 'All products',
                //               // ),
                //               const SizedBox(
                //                 height: 25,
                //               ),
                // StreamBuilder<QuerySnapshot>(
                //     stream: FirebaseFirestore.instance
                //         .collection('products')
                //         .snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else {
                //         if (snapshot.data == null) {
                //           return Center(
                //             child: Text("There is no products"),
                //           );
                //         }
                //         return GridView.builder(
                //             itemCount: controller.productList.length,
                //             gridDelegate:
                //                 const SliverGridDelegateWithFixedCrossAxisCount(
                //                     crossAxisCount: 2),
                //             itemBuilder: (context, index) =>
                //                 ProductWidget(index: index
                //                     // id: controller.productList[index].id
                //                     ));
                //       }
                //     }))
                Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: Obx(
            () => controller.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 0.5,
                    ),
                  )
                : controller.productList == null
                    ? const Center(
                        child: Text("There is no products"),
                      )
                    : GridView.builder(
                        itemCount: controller.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => ProductWidget(
                              index: index,
                              // id: controller.productList[index].id
                            )),
          ),
        )
            // ProductGridWidget(
            //   crossAxisCount: size.width < 650 ? 2 : 4,
            //   childAspectRatio:
            //       size.width < 650 && size.width > 350 ? 1.1 : 0.8,
            //   isInMain: false,
            // ),
            // Responsive(
            //   mobile: ProductGridWidget(
            //     crossAxisCount: size.width < 650 ? 2 : 4,
            //     childAspectRatio:
            //         size.width < 650 && size.width > 350 ? 1.1 : 0.8,
            //     isInMain: false,
            //   ),
            //   desktop: ProductGridWidget(
            //     childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
            //     isInMain: false,
            //   ),
            // ),
            // ],
            // ),
            ));
  }
}
