import 'package:deneme/home_page.dart';
import 'package:deneme/kayit_ol.dart';
import 'package:deneme/list_user.dart';
import 'package:deneme/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginPage(),
        "/homepage": (context) => const HomePage(),
        "/kayitol": (context) => const KayitOl(),
        "/listuser": (context) => const ListUser(),
      },
    );
  }
}
