import 'package:flutter/material.dart';

import '../../../../project/constant/constant.dart';

class DividerWithTextWidget extends StatelessWidget {
  final String text;
  const DividerWithTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: const Divider(
        height: 20,
        thickness: 3,
        color: kMyPrimaryColor,
      ),
    ));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line,
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: kMyPrimaryColor,
          ),
        ),
        line,
      ],
    );
  }
}
