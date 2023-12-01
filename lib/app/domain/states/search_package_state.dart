import 'package:track_package_app/app/data/models/package_model.dart';

import '../errors/erros.dart';

abstract class SearchPackageState {}

class StartState implements SearchPackageState {
  const StartState();
}

class LoadingState implements SearchPackageState {
  const LoadingState();
}

class ErrorState implements SearchPackageState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SearchPackageState {
  final Package package;
  const SuccessState(this.package);
}
