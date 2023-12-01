import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_package_app/app/data/models/package_model.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/title_widget.dart';
import '../controller/search_controller.dart';

class SearchPackagePage extends StatefulWidget {
  const SearchPackagePage({super.key});

  @override
  State<SearchPackagePage> createState() => _SearchPackagePageState();
}

class _SearchPackagePageState extends State<SearchPackagePage> {
  final SearchPackageController controller = Get.put(SearchPackageController());

  @override
  void initState() {
    controller.getAllPackagesSave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchPackageController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleWidget(title: AppStrings.rastreamento_de_encomendas),
            Form(
              key: controller.formKey,
              child: TextFormField(
                controller: controller.codePackage,
                decoration: const InputDecoration(
                  hintText: AppStrings.digite_aqui_o_codigo_de_rastreio,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatorio';
                  }
                  return null;
                },
              ),
            ),
            TextButton(
              onPressed: () => controller.search(),
              child: const Text(AppStrings.procurar),
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  itemCount: controller.packages.length,
                  itemBuilder: (context, index) {
                    Package package = controller.packages[index];
                    return GestureDetector(
                      onTap: () => controller.openPackage(package),
                      child: ListTile(
                        title: Text(
                          package.codigo!,
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => controller.delete(package),
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
