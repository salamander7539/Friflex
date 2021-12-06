import 'package:friflex/data/api/core_api.dart';
import 'package:friflex/data/services/city_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton(() => CoreApi());
  locator.registerLazySingleton(() => CityService());
}
