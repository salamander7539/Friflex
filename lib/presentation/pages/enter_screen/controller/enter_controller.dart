import 'package:friflex/data/model/from_api/city_model.dart';
import 'package:friflex/data/services/city_service.dart';
import 'package:friflex/internal/locator.dart';
import 'package:friflex/presentation/pages/city_screen/view/city_screen.dart';
import 'package:get/get.dart';

class EnterController extends GetxController {
  final _cityService = locator<CityService>();

  RxBool loaded = false.obs;

  late CityData cityData;

  Future<bool?> getCityInformation({String? name}) async {
    loaded.value = false;

    final data = await _cityService.getData(name: name);

    if (data != null) {
      cityData = data;
      // print(cityData.main!.temp);
      // print(cityData.main!.humidity);
      // print(cityData.wind!.speed);
      loaded.value = true;
    }

    return loaded.value;
  }
}