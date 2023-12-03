import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_package_app/app/features/search_package/view/search_package_page.dart';

import 'app/core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TrackPackage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchPackagePage(),
      getPages: AppPages.pages,
    );
  }
}
