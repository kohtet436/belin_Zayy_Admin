import 'package:belin_zayy_admin/get/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'get/nav_binding.dart';
import 'get/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.lightTheme,
        getPages: Routes.pages,
        initialRoute: Routes.mainScreen,
        initialBinding: NavBinding());
    // FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text('App is being initialized'),
    //               ),
    //             ),
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Scaffold(
    //             body: Center(
    //               child: Center(
    //                 child: Text('An error has been occured ${snapshot.error}'),
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //       return MultiProvider(
    //         providers: [
    //           ChangeNotifierProvider(create: (_) => DraverProvider()),
    //           ChangeNotifierProvider(create: (_) => MenuControllerProvider()),
    //           ChangeNotifierProvider(
    //             create: (_) {
    //               return themeChangeProvider;
    //             },
    //           ),
    //         ],
    //         child: Consumer<DarkThemeProvider>(
    //           builder: (context, themeProvider, child) {
    //             return MaterialApp(
    //                 debugShowCheckedModeBanner: false,
    //                 title: 'Grocery',
    //                 theme:
    //                     Styles.themeData(themeProvider.getDarkTheme, context),
    //                 home: const MainScreen(),
    //                 routes: {
    //                   UploadProductForm.routeName: (context) =>
    //                       const UploadProductForm(),
    //                 });
    //           },
    //         ),
    //       );
    //     });
  }
}
