import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MyDiriver extends StatelessWidget {
  const MyDiriver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Divider(
        thickness: 2,
        color: kMyPrimaryColor,
      ),
    );
  }
}
