import 'package:flutter/material.dart';
import 'eng_tr_uyg/screen/home_page.dart';
import 'login/login_page.dart';
import 'project/constant/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
