import 'package:e_pilkades_nania/app/model/hasil_pemilihan.dart';
import 'package:get/get.dart';

import '../service/pemilihan_service.dart';

class PemilihanController extends GetxController {
  Rx<List<HasilPemilihan>> hasilPemilihan = Rx<List<HasilPemilihan>>([]);

  @override
  void onInit() async {
    super.onInit();
    await hasil();
  }

  Future<void> hasil() async {
    final result = await PemilihanService.hasilPemilihan();
    print("HASIL : ${result.data}");
    if (result.success && result.data is List<HasilPemilihan>) {
      List<HasilPemilihan> data = result.data;
      hasilPemilihan.update((val) {
        hasilPemilihan.value = data;
      });
    }
  }
}
