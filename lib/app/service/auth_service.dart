import 'package:e_pilkades_nania/app/model/api_return_value.dart';
import 'package:e_pilkades_nania/app/model/user.dart';
import 'package:e_pilkades_nania/app/service/store_service.dart';
import 'package:intl/intl.dart';

import '../../config/constant.dart';
import 'http.dart';

class AuthService {
  static Future<ApiReturnValue> daftar(
    String nama,
    String nik,
    String tempatLahir,
    DateTime tanggalLahir,
    String jenisKelamin,
    String agama,
    String noHp,
    String alamat,
    String password,
    String confirm,
  ) async {
    return await Http.post(REGISTER_URL, {
      "nama": nama,
      "nik": nik,
      "tempat_lahir": tempatLahir,
      "tanggal_lahir": DateFormat('yyyy-MM-dd').format(tanggalLahir),
      "jenis_kelamin": jenisKelamin,
      "agama": agama,
      "no_hp": noHp,
      "alamat": alamat,
      "password": password,
      "password_confirmation": confirm
    });
  }

  static Future<ApiReturnValue> masuk(String nik, String password) async {
    final result =
        await Http.post(LOGIN_URL, {"nik": nik, "password": password});
    if (result.success) {
      Map<String, dynamic> user = result.data['user'];
      String token = result.data['token'];
      StoreService.storeString("token", token);
      StoreService.storeMap('user', user);
    }
    return result;
  }

  static Future<User> user() async {
    final token = await StoreService.getString("token");
    final result = await Http.get(USER_URL, token: token);
    if (result.success) {
      return User.fromMap(result.data);
    }
    AuthService.keluar();
    return User();
  }

  static Future<void> keluar() async {
    await Http.get(LOGOUT_URL);
    StoreService.clearStore();
  }
}
