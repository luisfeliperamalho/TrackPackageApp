import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_package_app/app/data/datasources/search_package_datasource.dart';
import 'package:track_package_app/app/data/models/package_model.dart';
import 'package:track_package_app/app/data/repositories/search_package_repository_impl.dart';
import 'package:track_package_app/app/domain/states/search_package_state.dart';
import 'package:track_package_app/app/features/search_package/view/detail_package.dart';

import '../../../domain/repositories/search_package_repository.dart';

class SearchPackageController extends GetxController {
  static SearchPackageController get to => Get.find();
  final codePackage = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxList<Package> packages = <Package>[].obs;

  void search() async {
    if (formKey.currentState!.validate()) {
      final SearchPackageRepository search =
          SearchPackageRepositoryImpl(datasource: SearchPackageDatasource());

      SearchPackageState state =
          await search.getDetailsPackage(codePackage.text);

      if (state is SuccessState) {
        codePackage.clear();

        save(state.package);
        Get.to(DetailPackagePage(
          package: state.package,
        ));
      }
    }
  }

  void openPackage(Package package) async {
    Get.to(DetailPackagePage(
      package: package,
    ));

    codePackage.clear();
  }

  void save(Package package) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    packages = await getAllPackagesSave();

    //evitar duplicatas
    bool duplicado = false;

    for (Package i in packages) {
      if (package.codigo == i.codigo) {
        duplicado = true;
      }
    }

    if (!duplicado) {
      packages.add(package);
    }

    await prefs.setString('packages', jsonEncode(packages));

    await getAllPackagesSave();
  }

  void delete(Package package) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    packages = await getAllPackagesSave();

    packages.remove(package);

    await prefs.setString('packages', jsonEncode(packages));

    await getAllPackagesSave();
  }

  void change() {}

  Future<RxList<Package>> getAllPackagesSave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? listInString = prefs.getString('packages');
    if (listInString != null) {
      List jsonResponse = jsonDecode(listInString);
      if (jsonResponse.isNotEmpty) {
        for (Map<String, dynamic> package in jsonResponse) {
          packages.add(Package.fromJson(package));
        }
      }
    }

    packages.refresh();

    return packages;
  }
}


//QQ204487907BR