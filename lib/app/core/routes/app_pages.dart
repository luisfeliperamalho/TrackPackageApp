import 'package:get/get.dart';
import 'package:track_package_app/app/features/search_package/view/detail_package.dart';
import 'package:track_package_app/app/features/search_package/view/search_package_page.dart';

import '../../features/search_package/binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPackagePage(),
      binding: SearchPackageBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPackagePage(),
    ),
  ];
}
