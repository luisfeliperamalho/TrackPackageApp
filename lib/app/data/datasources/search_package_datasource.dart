import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/app_urls.dart';
import '../models/package_model.dart';

class SearchPackageDatasource {
  @override
  Future<Package> getDetailsPackage(String codePackage) async {
    debugPrint(
        "LOGIN - POST = ${AppUrls.getDetailsPackageUrl}&codigo=$codePackage");
    http.Response response = await http.get(
      Uri.parse("${AppUrls.getDetailsPackageUrl}&codigo=$codePackage"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return Package.fromJson(json);
    } else {
      throw Exception();
    }
  }
}
