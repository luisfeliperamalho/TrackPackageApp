import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_package_app/app/data/models/event.dart';
import 'package:track_package_app/app/data/models/package_model.dart';
import 'package:track_package_app/app/features/widgets/title_widget.dart';
import '../../widgets/top_app_bar_widget.dart';
import '../controller/search_controller.dart';

class DetailPackagePage extends StatelessWidget {
  final SearchPackageController controller = Get.put(SearchPackageController());

  final Package? package;
  DetailPackagePage({super.key, this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopAppBarWidget(
            widgets: [
              ListTile(
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                title: TitleWidget(
                  title: package!.codigo!,
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.delete(package!);
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              itemCount: package!.eventos!.length,
              itemBuilder: (context, index) {
                Event event = package!.eventos![index];
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      event.status!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(event.hora!),
                  Text(event.local!),
                  Text(event.data!),
                ]);
              },
              separatorBuilder: (context, index) => const Divider(
                height: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
