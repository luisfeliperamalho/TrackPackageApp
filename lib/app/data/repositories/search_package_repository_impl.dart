import 'package:track_package_app/app/data/models/package_model.dart';

import '../../domain/errors/erros.dart';
import '../../domain/repositories/search_package_repository.dart';
import '../../domain/states/search_package_state.dart';
import '../datasources/search_package_datasource.dart';

class SearchPackageRepositoryImpl implements SearchPackageRepository {
  final SearchPackageDatasource datasource;

  SearchPackageRepositoryImpl({required this.datasource});

  @override
  Future<SearchPackageState> getDetailsPackage(String codePackage) async {
    try {
      Package package = await datasource.getDetailsPackage(codePackage);
      return SuccessState(package);
    } catch (e) {
      return ErrorState(ErrorSearch());
    }
  }
}
