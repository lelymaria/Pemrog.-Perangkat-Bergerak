import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lely_firebase_project/page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Users",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('id', 'ID')],
    );
  }
}