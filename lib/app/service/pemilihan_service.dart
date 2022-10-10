import 'package:e_pilkades_nania/app/model/hasil_pemilihan.dart';

import '../../config/constant.dart';
import '../model/api_return_value.dart';
import 'http.dart';
import 'store_service.dart';

class PemilihanService {
  static Future<ApiReturnValue> pilih(int idCalonKadesPeriode) async {
    final token = await StoreService.getString("token");

    final result = await Http.post(
        PEMILIHAN_URL, {"id_calon_periode": idCalonKadesPeriode},
        token: token);
    return result;
  }

  static Future<ApiReturnValue> checkPemilihan() async {
    final token = await StoreService.getString("token");
    final result = await Http.get(CHECK_PEMILIHAN_URL, token: token);
    return result;
  }

  static Future<ApiReturnValue> hasilPemilihan() async {
    final token = await StoreService.getString("token");

    final result = await Http.get(HASIL_PEMILIHAN_URL, token: token);

    if (!result.success || result.data == null) return result;

    List<HasilPemilihan> hasil = [];

    for (var data in result.data) {
      hasil.add(HasilPemilihan.fromMap(data));
    }
    return ApiReturnValue(
        message: result.message,
        statusCode: result.statusCode,
        success: result.success,
        data: hasil);
  }
}
