import 'package:e_pilkades_nania/app/controller/calon_kades_controller.dart';
import 'package:e_pilkades_nania/app/controller/user_controller.dart';
import 'package:e_pilkades_nania/app/service/auth_service.dart';
import 'package:e_pilkades_nania/config/theme.dart';
import 'package:e_pilkades_nania/resource/view/splash_sreen.dart';
import 'package:e_pilkades_nania/resource/widget/calkades_card.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../app/controller/periode_controller.dart';
import '../../app/model/user.dart';
import 'calkades_page.dart';
import 'hasil_pemilihan_page.dart';
import 'pemilihan_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainC = Get.find<UserController>();
  final calkadesC = Get.put(CalonKadesController());
  final periodeC = Get.put(PeriodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              calkadesC.daftarCalkades();
              periodeC.periodeAktif();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 24),
                    width: double.infinity,
                    color: primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("E-Pilkades Nania",
                                style: titleStyle2.copyWith(color: whiteColor)),
                            IconButton(
                                onPressed: () async {
                                  mainC.logout();
                                  Get.delete<UserController>();
                                  Get.offAll(const SplashScreen());
                                },
                                icon:
                                    const Icon(Icons.logout, color: whiteColor))
                          ],
                        ),
                        // const SizedBox(height: 21),
                        Obx(() => Text("Hi, ${mainC.user.value.nama}",
                            style: primaryStyle.copyWith(color: whiteColor))),
                        Text(
                            "Mari memilih pemimpin untuk Desa Nania\nyang lebih baik",
                            style: primaryStyle.copyWith(color: whiteColor)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    width: double.infinity,
                    color: whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            color: warningLightColor,
                            border: const Border(
                              left: BorderSide(
                                color: warningColor,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: warningColor,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Obx(
                                () => Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(periodeC.pesan.value),
                                    periodeC.aktif.value
                                        ? ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PemilihanPage()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: primaryColor,
                                            ),
                                            child: const Text("Pilih"),
                                          )
                                        : const SizedBox(),
                                    periodeC.sudahPilih.value
                                        ? ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HasilPemilihanPage(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: primaryColor,
                                            ),
                                            child: const Text("Lihat"),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          "Calon Kepala Desa",
                          style: primaryStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Obx(() => Column(
                              children: calkadesC.calkades.value.map((kades) {
                                return CalkadesCard(
                                  nama: "${kades.nama}",
                                  nomor: "${kades.nomorUrut}",
                                  moto: "${kades.moto}",
                                  onButtonPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => CalkadesPage(
                                                  idKades: kades.id!,
                                                )));
                                  },
                                );
                              }).toList(),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
