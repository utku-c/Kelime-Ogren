import 'package:flutter/material.dart';

class YardimSayfasiBody extends StatefulWidget {
  const YardimSayfasiBody({Key? key}) : super(key: key);

  @override
  State<YardimSayfasiBody> createState() => _YardimSayfasiBodyState();
}

class _YardimSayfasiBodyState extends State<YardimSayfasiBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Yardım Sayfası"),
      ],
    );
  }
}
