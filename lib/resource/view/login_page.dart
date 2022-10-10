import 'package:e_pilkades_nania/app/controller/auth_controller.dart';
import 'package:e_pilkades_nania/app/controller/user_controller.dart';
import 'package:e_pilkades_nania/app/model/user.dart';
import 'package:e_pilkades_nania/resource/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme.dart';
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authC = Get.put(AuthController());
  final mainC = Get.find<UserController>();

  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Text('Masuk', style: titleStyle2),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Text(
                  'Hai pemilih silahkan masuk terlebih dahulu untuk mengakses E-Pilkades Nania.',
                  style: primaryStyle),
            ),
            const SizedBox(height: 22),
            InputText(
              label: 'Nomor Induk Kependudukan (NIK)',
              hintText: "Masukan NIK",
              controller: _nikController,
            ),
            InputText(
              label: 'Password',
              hintText: 'Masukan password',
              controller: _passwordController,
              obsecureText: true,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Obx(
                () => ElevatedButton(
                  onPressed: authC.loading.value
                      ? null
                      : () {
                          authC.loading.value = true;
                          authC
                              .masuk(
                                  _nikController.text, _passwordController.text)
                              .then((value) {
                            if (value.success) {
                              mainC.user.update((val) {
                                mainC.user.value =
                                    User.fromMap(value.data['user']);
                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(value.message),
                                // backgroundColor: (Colors.black12),
                              ));
                            }
                            authC.loading.value = false;
                          });
                        },
                  // ignore: sort_child_properties_last
                  child: Text(authC.loading.value ? "Proses..." : "MASUK"),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  child: const Text("Belum terdaftar? Daftar disini.",
                      style: primaryStyle)),
            )
          ],
        ),
      ),
    );
  }
}
