import 'package:app/application.dart';
import 'package:app/config/locales.dart';
import 'package:app/config/services/download_service.dart';
import 'package:app/core/di/injector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DownloadService.initialize();
  await EasyLocalization.ensureInitialized();
  await initInjector();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Bloc.observer = CustomBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/translations',
      fallbackLocale: russianLocale,
      child: const YarimOy(),
    ),
  );
}
