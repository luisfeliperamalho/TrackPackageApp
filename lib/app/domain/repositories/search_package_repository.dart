import '../states/search_package_state.dart';

abstract class SearchPackageRepository {
  Future<SearchPackageState> getDetailsPackage(String codePackage);
}
