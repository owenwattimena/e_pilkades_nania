import 'package:e_pilkades_nania/app/model/calkades.dart';
import 'package:e_pilkades_nania/app/service/calkades_service.dart';
import 'package:e_pilkades_nania/config/constant.dart';
import 'package:e_pilkades_nania/resource/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalonKadesController extends GetxController{
  Rx<List<Calkades>> calkades = Rx<List<Calkades>>(<Calkades>[]);
  Rx<Calkades> detailCalkades = Rx<Calkades>(Calkades());

  @override
  void onInit() async {
    super.onInit();
    await daftarCalkades();
  }

  Future<void> daftarCalkades()async
  {
    final result = await CalkadesService.calonKades();
    if(result.statusCode == UNAUTHORIZED){
      Get.toEnd(() => const LoginPage());
    }else{
      calkades.update((val) {
        calkades.value = result.data;
      });
    }
  }

  void detailKades(int idKades) async
  {
    final result = await CalkadesService.calonKades(idKades: idKades);
    if(result.statusCode == UNAUTHORIZED){
      Get.off(const LoginPage());
    }else{
      if(result.data is Calkades){
        detailCalkades.update((val) {
          detailCalkades.value = result.data;
        });
      }
    }
  }
}