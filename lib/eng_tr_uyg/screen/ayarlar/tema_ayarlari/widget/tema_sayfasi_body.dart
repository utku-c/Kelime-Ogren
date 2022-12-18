import 'package:flutter/material.dart';

class TemaSayfasiBody extends StatefulWidget {
  const TemaSayfasiBody({Key? key}) : super(key: key);

  @override
  State<TemaSayfasiBody> createState() => _TemaSayfasiBodyState();
}

class _TemaSayfasiBodyState extends State<TemaSayfasiBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Tema Sayfası"),
      ],
    );
  }
}
