// ignore_for_file: sort_child_properties_last

import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../app/controller/calon_kades_controller.dart';
import '../../app/controller/periode_controller.dart';
import '../../app/controller/user_controller.dart';
import '../../config/constant.dart';
import '../../config/theme.dart';
import '../widget/calkades_card.dart';

class PemilihanPage extends StatefulWidget {
  const PemilihanPage({Key? key}) : super(key: key);

  @override
  State<PemilihanPage> createState() => _PemilihanPageState();
}

class _PemilihanPageState extends State<PemilihanPage> {
  final userC = Get.find<UserController>();
  final periodeC = Get.find<PeriodeController>();
  final calkadesC = Get.put(CalonKadesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Pemilihan Kepala Desa"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: primaryColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${userC.user.value.nama}",
                      style: primaryStyle.copyWith(color: whiteColor),
                    ),
                    Text(
                      "Pililah dengan hati nuranimu bukan dengan paksaan. Pilihanmu hari ini menentukan masa depan Desa Nania di hari esok.",
                      style: primaryStyle.copyWith(color: whiteColor),
                    ),
                  ]),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Calon Kepala Desa",
                style: primaryStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: calkadesC.calkades.value.map((kades) {
                  return CalkadesCard(
                    nama: "${kades.nama}",
                    nomor: "${kades.nomorUrut}",
                    moto: "${kades.moto}",
                    onButtonPilihPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 166,
                                      height: 247,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(kades.foto != null ? BASE_URL + kades.foto! : '' ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text("Nomor Urut ${kades.nomorUrut}",
                                        style: primaryStyle.copyWith(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 12),
                                    Text("${kades.nama}", style: titleStyle2),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Batal"),
                                            style: ElevatedButton.styleFrom(
                                              primary: primaryColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              periodeC
                                                  .pilih(kades.id!)
                                                  .then((value) async {
                                                if (value) {
                                                  showInfoDialog();
                                                }
                                              });
                                            },
                                            child: const Text("Pilih"),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showInfoDialog()async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            title: const Text("Selamat"),
            content: const Text("Pilihanmu telah di kirim"),
            actions: [
              ElevatedButton(onPressed: (){
                periodeC.pesan.value = "Terima kasih telah melakukan pemilihan Kepala Desa Nania. Hasil akan di tampilkan setelah selesai pemilihan.";
                periodeC.aktif.value = false;
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          );
        });
  }
}
