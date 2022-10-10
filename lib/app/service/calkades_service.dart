import 'package:e_pilkades_nania/app/model/api_return_value.dart';
import 'package:e_pilkades_nania/app/model/calkades.dart';
import 'package:e_pilkades_nania/app/model/user.dart';
import 'package:e_pilkades_nania/app/service/http.dart';
import 'package:e_pilkades_nania/app/service/store_service.dart';

import '../../config/constant.dart';

class CalkadesService {
  static Future<ApiReturnValue> calonKades({int? idKades}) async {
    final token = await StoreService.getString("token");
    ApiReturnValue result;
    if (idKades == null) {
      result = await Http.get(CALKADES_URL, token: token);
    } else {
      result = await Http.get("$CALKADES_URL/$idKades", token: token);
    }
    if (result.statusCode != UNAUTHORIZED) {
      if (idKades == null) {
        List<Calkades> calkades = [];
        if (result.data != null) {
          for (var data in result.data) {
            calkades.add(Calkades.fromMap(data));
          }
        }
        return ApiReturnValue(
            message: result.message,
            statusCode: result.statusCode,
            success: result.success,
            data: calkades);
      } else {
        if (result.data != null) {
          return ApiReturnValue(
            message: result.message,
            statusCode: result.statusCode,
            success: result.success,
            data: Calkades.fromMap(result.data),
          );
        }
      }
    }

    return result;
  }
}
