import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

class TCardButton extends StatelessWidget {
  const TCardButton({
    Key? key,
    required this.functuon,
    required this.name,
    required this.isActive,
  }) : super(key: key);
  final VoidCallback functuon;
  final String name;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive == true ? functuon : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isActive == true
                ? kMyPrimaryColor
                : kMyPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: kMyPrimaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  wordSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
