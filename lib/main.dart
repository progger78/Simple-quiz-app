import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/routes/route_helper.dart';
import 'package:quiz_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      getPages: RouteHelper.pages,
      initialRoute: RouteHelper.initialScreen,
    );
  }
}
