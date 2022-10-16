import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../app/controller/pemilihan_controller.dart';
import '../../config/theme.dart';

class HasilPemilihanPage extends StatefulWidget {
  const HasilPemilihanPage({Key? key}) : super(key: key);

  @override
  State<HasilPemilihanPage> createState() => _HasilPemilihanPageState();
}

class _HasilPemilihanPageState extends State<HasilPemilihanPage> {

  final hasilC = Get.put(PemilihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Hasil Pemilihan Kepala Desa"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Obx(()=>Text("Total Suara : ${hasilC.totalPemilih.value}" , style: titleStyle2))),
          Expanded(
            child: Obx(()=>ListView.builder(
              itemCount: hasilC.hasilPemilihan.value.length,
              itemBuilder: (BuildContext context, int index){
              return Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 136,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          decoration: const BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  bottomLeft: Radius.circular(3))),
                          child: Column(children: [
                            Text("NO.",
                                style: primaryStyle.copyWith(color: whiteColor)),
                            const SizedBox(height: 26),
                            Text("${hasilC.hasilPemilihan.value[index].nomorUrut}", style: titleStyle1.copyWith(color: whiteColor)),
                          ]),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75 - 48 - 8,
                          height: 136,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 14),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${hasilC.hasilPemilihan.value[index].jumlahSuara} Suara",
                                  style: titleStyle2.copyWith(color: Colors.orange)
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${hasilC.hasilPemilihan.value[index].nama}",
                                  style: titleStyle2,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  "\"${hasilC.hasilPemilihan.value[index].moto}\"",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: primaryStyle.copyWith(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
            })),
          ),
        ],
      ),
    );
  }
}
