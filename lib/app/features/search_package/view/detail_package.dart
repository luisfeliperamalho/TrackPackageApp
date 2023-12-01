import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_package_app/app/data/models/event.dart';
import 'package:track_package_app/app/data/models/package_model.dart';

import '../../../core/constants/app_strings.dart';

class DetailPackagePage extends StatelessWidget {
  final Package? package;
  const DetailPackagePage({super.key, this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(package!.codigo!),
            Text(package!.time!.toString()),
            Text(package!.servico!),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                itemCount: package!.eventos!.length,
                itemBuilder: (context, index) {
                  Event event = package!.eventos![index];
                  return Column(children: [
                    Text(event.status!),
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
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(AppStrings.voltar),
            ),
          ],
        ),
      ),
    );
  }
}
