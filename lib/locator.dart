import 'package:get_it/get_it.dart';
import 'package:videoslideapp/services/dio_service.dart';

final getIt = GetIt.instance;

void setUpDependencyInjection() {
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManagerImpl());
}
