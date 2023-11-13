import 'package:flutter/material.dart';
import 'package:belin_zayy_admin/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllerss/nav_controller.dart';

class SideMenu extends GetView<NavController> {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    // final themeState = Provider.of<DarkThemeProvider>(context);
    // DraverProvider draverProvider=context.read<DraverProvider>();

    return
        // Consumer<DraverProvider>(
        //   builder: (BuildContext context, value, Widget? child) =>
        Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/groceries.png",
            ),
          ),
          DrawerListTile(
            title: "Main",
            press: () {
              controller.change(AllPage.main);

              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (context) => const MainScreen(),
              //   ),
              // );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all products",
            press: () {
              controller.change(AllPage.products);
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AllProductsScreen()));
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "View all orders",
            press: () {
              controller.change(AllPage.orders);

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AllOrdersScreen()));
            },
            icon: IconlyBold.bag_2,
          ),
          DrawerListTile(
            title: "All banner",
            press: () {
              controller.change(AllPage.banner);

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const AllOrdersScreen()));
            },
            icon: Icons.image,
          ),
          // SwitchListTile(
          //     title: const Text('Theme'),
          //     secondary: Icon(
          //       themeState.getDarkTheme
          //         ? Icons.dark_mode_outlined
          //         : Icons.light_mode_outlined),
          //     value: theme,
          //     onChanged: (value) {
          //       // setState(() {
          //         // themeState.setDarkTheme = value;
          //       // });
          //     })
        ],
      ),
      // ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    // final theme = Utils(context).getTheme;
    final color = Colors.black;
    // theme == true ?
    // :
    // Colors.black;

    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: color,
        ));
  }
}
