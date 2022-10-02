import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/login/login_binding.dart';
import 'package:evaproject/src/routes/app_pages.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context){
        return 'Infotep';
      },
      initialRoute: AppRoutes.login,
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}