import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_package_app/app/data/models/package_model.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/title_widget.dart';
import '../../widgets/top_app_bar_widget.dart';
import '../controller/search_controller.dart';
import 'loading.dart';

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
    controller.loading = Loading(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          TopAppBarWidget(
            widgets: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(title: AppStrings.suas_encomendas),
                    ],
                  ),
                ),
              ),
              Form(
                key: controller.formKey,
                child: buildPesquisar(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.search();
                      }
                    },
                    child: Text(
                      AppStrings.procurar,
                      style: TextStyle(color: Colors.green[600]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  itemCount: controller.packages.length,
                  itemBuilder: (context, index) {
                    Package package = controller.packages[index];
                    return GestureDetector(
                      onTap: () => controller.openPackage(package),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPesquisar() {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ));

    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      child: TextFormField(
        controller: controller.codePackage,
        style: const TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        decoration: InputDecoration(
          hintText: AppStrings.digite_aqui_o_codigo_de_rastreio.toUpperCase(),
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          focusColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFFFFFFF),
          ),
          counterText: "",
          fillColor: Colors.green[600],
          filled: true,
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
          hoverColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatorio';
          }
          return null;
        },
        onChanged: (value) {},
      ),
    );
  }
}
