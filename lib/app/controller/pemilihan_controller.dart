import 'package:e_pilkades_nania/app/model/hasil_pemilihan.dart';
import 'package:e_pilkades_nania/app/model/total_suara.dart';
import 'package:get/get.dart';

import '../service/pemilihan_service.dart';

class PemilihanController extends GetxController {
  Rx<List<HasilPemilihan>> hasilPemilihan = Rx<List<HasilPemilihan>>([]);
  RxInt totalPemilih = 0.obs;

  @override
  void onInit() async {
    await hasil();
    await totalSuara();
    super.onInit();
  }

  Future<void> totalSuara() async {
    final result = await PemilihanService.totalSuara();
    if (result.success && result.data is TotalSuara) {
      TotalSuara totalSuara = result.data;
      totalPemilih.value = totalSuara.total!;
    }
  }
  Future<void> hasil() async {
    final result = await PemilihanService.hasilPemilihan();
    if (result.success && result.data is List<HasilPemilihan>) {
      List<HasilPemilihan> data = result.data;
      hasilPemilihan.update((val) {
        hasilPemilihan.value = data;
      });
    }
  }
}
