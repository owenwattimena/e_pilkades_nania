import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// this class use to set data to shared preference
class StoreService{
  static void storeInt(String key, int value){
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.getInstance().then((prefs){
      prefs.setInt(key, value);
    });
  }

  static Future<int?> getInt(String key) async{
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static void storeString(String key, String value){
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.getInstance().then((prefs){
      prefs.setString(key, value);
    });
  }

  static Future<String?> getString(String key) async{
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static void storeMap(String key, Map<String, dynamic> value){
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.getInstance().then((prefs){
      prefs.setString(key, json.encode(value));
    });
  }

  static Future<Map<String, dynamic>?> getMap(String key) async{
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    String? stringMap = prefs.getString(key);
    if(stringMap == null) return null;
    return json.decode(stringMap);
  }

  static void clearStore(){
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.getInstance().then((prefs){
      prefs.clear();
    });
  }
}