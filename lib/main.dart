import 'package:booksotre/book_store_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: BookStoreApp()));
}


// flutter pub run easy_localization:generate -S assets/translations -O lib/gen/translations -o  locale_keys.g.dart -f keys
