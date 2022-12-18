import 'package:flutter/material.dart';
import '../../project/constant/constant.dart';

class YoneticiGiris extends StatelessWidget {
  const YoneticiGiris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          //onTap: (() => Navigator.pushNamed(context, SignUpScreen.routeName)),
          child: const Text(
            "Yönetici Girişi",
            style: TextStyle(
              fontSize: kMyFontSizelow,
              color: kMyPrimaryColor,
              decoration: TextDecoration.underline,
              decorationThickness: 3,
            ),
          ),
        )
      ],
    );
  }
}
