import 'package:friflex/data/api/core_api.dart';
import 'package:friflex/data/model/from_api/city_model.dart';
import 'package:friflex/domain/dialogs.dart';
import 'package:friflex/internal/locator.dart';

class CityService {

  final CoreApi _coreApi = locator<CoreApi>();

  Future<CityData?> getData({String? name}) async {
    final url = '${_coreApi.baseUrl}?q=$name&appid=8d8f15111f065e3b19bceac91611c10d';

    final result = await _coreApi.getRequest(url);

    if (result.response != null) {
      return CityData.fromJson(result.response);
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}