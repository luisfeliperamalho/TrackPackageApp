import 'package:get/get.dart';
import 'package:track_package_app/app/features/search_package/controller/search_controller.dart';

class SearchPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPackageController());
  }
}
