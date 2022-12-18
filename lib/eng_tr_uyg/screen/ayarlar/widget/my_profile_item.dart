import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileMenuItem extends StatelessWidget {
  final String svgUrl;
  final String text;
  const MyProfileMenuItem({
    Key? key,
    required this.svgUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 4),
      child: Row(
        children: [
          const SizedBox(width: 14),
          SizedBox(
            height: 36,
            width: 36,
            child: SvgPicture.asset(svgUrl),
          ),
          const SizedBox(width: 14),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
