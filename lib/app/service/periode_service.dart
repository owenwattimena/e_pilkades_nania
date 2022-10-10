import 'package:e_pilkades_nania/app/model/api_return_value.dart';
import 'package:e_pilkades_nania/app/service/store_service.dart';

import '../../config/constant.dart';
import '../model/periode.dart';
import 'http.dart';

class PeriodeService{
  static Future<ApiReturnValue> periode()async{
    final token = await StoreService.getString("token");
    var result = await Http.get(PERIODE_URL, token: token);
    if(result.success){
      if(result.data['periode_aktif'] != null){
        return ApiReturnValue(data: Periode.fromMap(result.data), message: result.message, statusCode: result.statusCode, success: result.success);
      }
    }
    return result;
  }
}