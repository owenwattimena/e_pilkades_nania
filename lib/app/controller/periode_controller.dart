import 'package:e_pilkades_nania/app/model/periode.dart';
import 'package:e_pilkades_nania/app/service/auth_service.dart';
import 'package:e_pilkades_nania/config/constant.dart';
import "package:get/get.dart";
import 'package:intl/intl.dart';

import '../../resource/view/login_page.dart';
import '../service/pemilihan_service.dart';
import '../service/periode_service.dart';

class PeriodeController extends GetxController {
  Rx<Periode> periode = Rx<Periode>(Periode());
  RxString pesan = ''.obs;
  RxBool aktif = false.obs;
  RxBool sudahPilih = false.obs;
  RxBool lihatHasil = false.obs;
  RxBool onLoading = false.obs;


  @override
  void onInit() async {
    super.onInit();
    await periodeAktif();
  }

  Future<bool> pilih(int idCalonKadesPeriode) async {
    final result = await PemilihanService.pilih(idCalonKadesPeriode);
    return result.success;
  }

  Future<void> periodeAktif() async {
    final result = await PeriodeService.periode();
    if (result.statusCode == UNAUTHORIZED) {
      AuthService.keluar();
      Get.off(const LoginPage());
    } else {
      if (result.data is Periode) {
        Periode periode = result.data;
        DateTime today = DateTime.now();
        DateTime? electionDay = periode.tanggalPemilihan;

        if (electionDay != null) {
          String electionFormat = DateFormat("yyyy-MM-dd").format(electionDay);
          DateTime? electionStart =
              DateTime.parse("$electionFormat ${periode.jamMulaiPemilihan}");
          DateTime? electionEnd =
              DateTime.parse("$electionFormat ${periode.jamSelesaiPemilihan}");

          int intToday = today.millisecondsSinceEpoch;
          int intStart = electionStart.millisecondsSinceEpoch;
          int intEnd = electionEnd.millisecondsSinceEpoch;

          String mulai = DateFormat('dd MMMM yyyy').format(electionStart);

          if (intToday >= intStart && intToday <= intEnd && !periode.sudahMemilih) {
            pesan.value =
                "Pemilihan Kepala Desa Nania telah dibuka ayo tentukan pilihan anda!";
            aktif.value = true;
            sudahPilih.value = false;
          } else if (intToday < intStart) {
            aktif.value = false;
            sudahPilih.value = false;
            pesan.value =
                "Pemilihan Kepala Desa Nania akan dilaksanakan pada $mulai mulai pukul ${periode.jamMulaiPemilihan} s/d ${periode.jamSelesaiPemilihan} WIT!";
          } else if (intToday > intEnd) {
            aktif.value = false;
            sudahPilih.value = true;
            pesan.value = "Pemilihan Kepala Desa Nania telah selesai!";
          } else {
            pesan.value =
                "Terima kasih telah melakukan pemilihan Kepada Desa Nania. Hasil akan di tampilkan setelah selesai pemilihan.";
            aktif.value = false;
            sudahPilih.value = false;
          }
        }
        this.periode.update((val) {
          this.periode.value = result.data;
        });
      }else{
        pesan.value =
                "Periode pemilihan belum di buat.";
            aktif.value = false;
            sudahPilih.value = false;
      }
    }
  }
}
