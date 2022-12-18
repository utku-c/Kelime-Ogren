import 'package:flutter/material.dart';
import '../project/constant/constant.dart';
import 'widget/sign_in_form.dart';
import 'widget/yonetici_giris.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  color: kMyPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SignForm(),
              YoneticiGiris(),
            ],
          ),
        ),
      ),
    );
  }
}
