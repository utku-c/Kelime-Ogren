import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

class KelimeKart extends StatefulWidget {
  const KelimeKart({
    Key? key,
    required this.trKelime,
    required this.engKelime,
  }) : super(key: key);
  final String? trKelime;
  final String? engKelime;

  @override
  State<KelimeKart> createState() => _KelimeKartState();
}

class _KelimeKartState extends State<KelimeKart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMyPrimaryTextColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 2.5,
          color: kMyPrimaryColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.engKelime ?? "",
            textAlign: TextAlign.center,
            style: kMyTextDecoration,
          ),
          const SizedBox(height: 20),
          Text(
            widget.trKelime ?? "",
            textAlign: TextAlign.center,
            style: kMyTextDecoration,
          ),
        ],
      ),
    );
  }
}
