import 'package:belin_zayy_admin/values/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:belin_zayy_admin/consts/constants.dart';
import 'package:belin_zayy_admin/widgets/buttons.dart';
import 'package:belin_zayy_admin/widgets/text_widget.dart';
import 'package:get/get.dart';
import '../get/color_manager.dart';
import '../get/routes.dart';
import '../widgets/orders_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    Color color = ColorManager.primaryColor;
    // Utils(context).color;
    // final menuProvider = Provider.of<MenuControllerProvider>(context);
    return SingleChildScrollView(
        controller: ScrollController(),
        // padding: const EdgeInsets.all(defaultPadding),
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: Column(
            children: [
              // Header(
              //   fct: () {
              //     menuProvider.controlDashboarkMenu();
              //   },
              //   title: 'Dashboard',
              // ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Latest Products',
                color: color,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  ButtonsWidget(
                      onPressed: () {
                        Get.toNamed(Routes.allProducts);
                      },
                      text: 'View All',
                      icon: Icons.store,
                      backgroundColor: ColorManager.primaryColor),
                  const Spacer(),
                  ButtonsWidget(
                      onPressed: () {
                        Get.toNamed(Routes.uploadProduct);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const UploadProductForm(),
                        //   ),
                        // );
                      },
                      text: 'Add product',
                      icon: Icons.add,
                      backgroundColor: ColorManager.primaryColor),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(height: defaultPadding),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       // flex: 5,
              //       child: Column(
              //         children: [
              // Responsive(
              //   mobile: ProductGridWidget(
              //     crossAxisCount: size.width < 650 ? 2 : 4,
              //     childAspectRatio:
              //         size.width < 650 && size.width > 350 ? 1.1 : 0.8,
              //   ),
              //   desktop: ProductGridWidget(
              //     childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
              //   ),
              // ),
              OrdersList(),
              //     ],
              //   ),
              // ),
            ],
          ),
        )
        // ],
        // ),
        );
  }
}
