import 'package:e_pilkades_nania/app/controller/calon_kades_controller.dart';
import 'package:e_pilkades_nania/config/constant.dart';
import 'package:e_pilkades_nania/config/theme.dart';
import 'package:e_pilkades_nania/resource/widget/label_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalkadesPage extends StatefulWidget {
  final int idKades;
  const CalkadesPage({Key? key, required this.idKades}) : super(key: key);

  @override
  State<CalkadesPage> createState() => _CalkadesPageState();
}

class _CalkadesPageState extends State<CalkadesPage> {
  final calkadesC = Get.find<CalonKadesController>();
  @override
  void initState() {
    super.initState();
    calkadesC.detailKades(widget.idKades);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text("Detail Calon Kepala Desa"),
      ),
      body: Container(
        color: primaryColor,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: primaryColor,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 170,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Obx(
                            () => Container(
                              width: 110,
                              height: 160,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      calkadesC.detailCalkades.value.foto != null ? BASE_URL + calkadesC.detailCalkades.value.foto! :
                                          ''),
                                ),
                              ),
                              // child: calkadesC.detailCalkades.value.foto != null ? Image.network(calkadesC.detailCalkades.value.foto!, fit: BoxFit.fill,) : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${calkadesC.detailCalkades.value.nama}",
                                      style: titleStyle2),
                                  Text(
                                      "\"${calkadesC.detailCalkades.value.moto}\"",
                                      style: primaryStyle.copyWith(
                                          color: greyColor)),
                                ],
                              ),
                            ),
                            LabelText(
                              label: "Tempat & Tanggal Lahir",
                              teks:
                                  "${calkadesC.detailCalkades.value.tempatLahir}, ${DateFormat('dd MMMM yyyy').format(calkadesC.detailCalkades.value.tanggalLahir ?? DateTime.now())}",
                            ),
                            LabelText(
                              label: "Jenis Kelamin",
                              teks:
                                  "${calkadesC.detailCalkades.value.jenisKelamin}",
                            ),
                            LabelText(
                              label: "Agama",
                              teks: "${calkadesC.detailCalkades.value.agama}",
                            ),
                            LabelText(
                              label: "Status Perkawinan",
                              teks:
                                  "${calkadesC.detailCalkades.value.statusPerkawinan}",
                            ),
                            LabelText(
                              label: "Nama Pasangan",
                              teks:
                                  "${calkadesC.detailCalkades.value.namaPasangan}",
                            ),
                            LabelText(
                              label: "Visi",
                              teks: "${calkadesC.detailCalkades.value.visi}",
                            ),
                            LabelText(
                              label: "Misi",
                              teks: "${calkadesC.detailCalkades.value.misi}",
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
