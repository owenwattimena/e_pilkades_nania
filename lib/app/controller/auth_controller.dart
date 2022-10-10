import 'package:e_pilkades_nania/app/model/api_return_value.dart';
import 'package:e_pilkades_nania/app/model/user.dart';
import 'package:e_pilkades_nania/app/service/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  RxBool loading = false.obs;

  Future<ApiReturnValue> masuk(String nik, String password) async {
    return await AuthService.masuk(nik, password);
  }

  Future<ApiReturnValue?> daftar(
    String nama,
    String nik,
    String tempatLahir,
    DateTime? tanggalLahir,
    String? jenisKelamin,
    String? agama,
    String noHp,
    String alamat,
    String password,
    String confirm,
  ) async {

    if(nama.isEmpty || nik.isEmpty || tempatLahir.isEmpty || noHp.isEmpty || alamat.isEmpty || password.isEmpty || confirm.isEmpty) return null;
    if(tanggalLahir == null || jenisKelamin == null || agama == null) return null;
    if(password != confirm) return null;

    return await AuthService.daftar(
      nama,
      nik,
      tempatLahir,
      tanggalLahir,
      jenisKelamin,
      agama,
      noHp,
      alamat,
      password,
      confirm,
    );
  }

  Future<User> user() async {
    return await AuthService.user();
  }

  Future<void> keluar() async {
    await AuthService.keluar();
  }
}
