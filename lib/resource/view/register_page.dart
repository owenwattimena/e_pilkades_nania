import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../app/controller/auth_controller.dart';
import '../../config/theme.dart';
import '../widget/text_input.dart';
import 'package:date_field/date_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authC = Get.find<AuthController>();

  final _namaController = TextEditingController();
  final _nikController = TextEditingController();
  final _tempatLahirController = TextEditingController();
  DateTime? tanggalLahir;
  final _jenisKelaminController = TextEditingController();
  final _agamaController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  String? selectedJK;
  String? selectedAgama;

  List<DropdownMenuItem<String>> get jenisKelamin {
    return [
      const DropdownMenuItem(value: "Laki-laki", child: Text("Laki-laki")),
      const DropdownMenuItem(value: "Perempuan", child: Text("Perempuan"))
    ];
  }

  List<DropdownMenuItem<String>> get agama {
    return [
      const DropdownMenuItem(value: "Islam", child: Text("Islam")),
      const DropdownMenuItem(value: "Protestan", child: Text("Protestan")),
      const DropdownMenuItem(value: "Katolik", child: Text("Katolik")),
      const DropdownMenuItem(value: "Hindu", child: Text("Hindu")),
      const DropdownMenuItem(value: "Budah", child: Text("Budah")),
      const DropdownMenuItem(value: "Konghuchu", child: Text("Konghuchu")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: Text('Daftar', style: titleStyle2),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: Text(
                    'Golput bukan solusi. Ayo daftarkan diri anda sebagai pemilih.',
                    style: primaryStyle),
              ),
              const SizedBox(height: 22),
              InputText(
                label: 'Nama Lengkap',
                hintText: "Masukan nama lengkap",
                controller: _namaController,
              ),
              InputText(
                label: 'Nomor Induk Kependudukan',
                hintText: 'Masukan NIK',
                controller: _nikController,
              ),
              InputText(
                label: 'Tempat Lahir',
                hintText: 'Masukan tempat lahir',
                controller: _tempatLahirController,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("Tanggal Lahir",
                    style: primaryStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      hintText: 'Pilih tanggal lahir'),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    tanggalLahir = value;
                  },
                ),
              ),
              // InputText(
              //   label: 'Tanggal Lahir',
              //   hintText: 'Masukan tempat tanggal',
              //   controller: _tanggalLahirController,
              // ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("Jenis Kelamin",
                    style: primaryStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DropdownButtonFormField(
                  value: selectedJK,
                  items: jenisKelamin,
                  onChanged: (String? value) {
                    selectedJK = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Pilih jenis kelamin",
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.grey, width: 1),
                  //   borderRadius: BorderRadius.circular(5),
                    // ),
                    border: OutlineInputBorder(
                      // borderSide: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: false,
                    // fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("Agama",
                    style: primaryStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DropdownButtonFormField(
                  value: selectedAgama,
                  items: agama,
                  onChanged: (String? value) {
                    selectedAgama = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Pilih Agama",
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.grey, width: 1),
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    border: OutlineInputBorder(
                      // borderSide: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: false,
                    // fillColor: Colors.white,
                  ),
                ),
              ),
              InputText(
                label: 'Nomor HP',
                hintText: 'Masukan no HP',
                controller: _noHpController,
              ),
              InputText(
                label: 'Alamat',
                hintText: 'Masukan alamat',
                controller: _alamatController,
              ),
              InputText(
                label: 'Password',
                hintText: 'Masukan password',
                controller: _passwordController,
                obsecureText: true,
              ),
              InputText(
                label: 'Ulang Password',
                hintText: 'Masukan ulang password',
                controller: _confirmController,
                obsecureText: true,
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: Obx(()=>ElevatedButton(
                  
                  onPressed: authC.loading.value ? null : () {
                    authC.loading.value = true;
                    String nama = _namaController.text;
                    String nik = _nikController.text;
                    String tempatLahir = _tempatLahirController.text;
                    String? jenisKelamin = selectedJK;
                    String? agama = selectedAgama;
                    String noHp = _noHpController.text;
                    String alamat = _alamatController.text;
                    String password = _passwordController.text;
                    String confirm = _confirmController.text;

                    authC
                        .daftar(
                            nama,
                            nik,
                            tempatLahir,
                            tanggalLahir,
                            jenisKelamin,
                            agama,
                            noHp,
                            alamat,
                            password,
                            confirm)
                        .then((result) {
                      if (result == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Mohon lengkapi data"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(result.message),
                        ));
                      }
                      authC.loading.value = false;
                    });
                  },
                  // ignore: sort_child_properties_last
                  child: Text(authC.loading.value ? "Proses..." :"DAFTAR"),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Sudah terdaftar? Masuk disini.",
                        style: primaryStyle)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
