import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:shuttle_king/screen/login/s_login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //await _initialize();
  await NaverMapSdk.instance.initialize(
      clientId: '7ur5iq5wx6',
      onAuthFailed: (error) {
        debugPrint('NaverMapSDK Error Auth failed: $error');
        //print('NaverMapSDK Error Auth failed: $error');
      });

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();


  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const GetMaterialApp(
        home: LoginScreen(), //App(),
        debugShowCheckedModeBanner: false,
      )));
}