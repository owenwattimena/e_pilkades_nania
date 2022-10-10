import 'dart:async';

import 'package:e_pilkades_nania/app/service/store_service.dart';
import 'package:e_pilkades_nania/resource/view/login_page.dart';
import 'package:e_pilkades_nania/resource/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controller/user_controller.dart';
import '../../config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final mainC = Get.put(UserController());


  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
  var duration = const Duration(seconds: 5);
  return Timer(duration, () {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => mainC.user.value.nama != null ? const MainPage() : const LoginPage()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 333,
              height: 154,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash-image.png'),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('E-Pilkades Nania', style: titleStyle1),
        const Text('Sistem Pemilihan Kepada Desa Nania Elektronik')
      ]),
    );
  }
}
