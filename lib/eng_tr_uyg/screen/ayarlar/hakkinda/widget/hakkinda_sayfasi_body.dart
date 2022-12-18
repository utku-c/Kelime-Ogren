import 'package:flutter/material.dart';

class HakkindaSayfasiBody extends StatefulWidget {
  const HakkindaSayfasiBody({Key? key}) : super(key: key);

  @override
  State<HakkindaSayfasiBody> createState() => _HakkindaSayfasiBodyState();
}

class _HakkindaSayfasiBodyState extends State<HakkindaSayfasiBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Hakkında Sayfası"),
      ],
    );
  }
}
