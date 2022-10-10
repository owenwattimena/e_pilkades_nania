import 'package:e_pilkades_nania/app/service/auth_service.dart';
import 'package:e_pilkades_nania/resource/view/login_page.dart';
import "package:get/get.dart";

import '../model/user.dart';

class UserController extends GetxController {
  Rx<User> user = Rx<User>(User());

  @override
  void onInit() {
    super.onInit();
    user.update((val) async {
      user.value = await AuthService.user();
      if (user.value.nama == null) {
        Get.toEnd(() => const LoginPage());
      }
    });
  }

  void logout() async {
    await AuthService.keluar();
    user.value = User();
  }
}
