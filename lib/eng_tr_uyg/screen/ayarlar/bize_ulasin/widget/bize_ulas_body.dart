import 'package:flutter/material.dart';
import '../../../../../project/constant/constant.dart';
import '../../../../../project/constant/default_button.dart';

class BizeUlasBody extends StatefulWidget {
  const BizeUlasBody({Key? key}) : super(key: key);

  @override
  State<BizeUlasBody> createState() => _BizeUlasBodyState();
}

class _BizeUlasBodyState extends State<BizeUlasBody> {
  final TextEditingController soru1 = TextEditingController();
  String gelenNot = "";
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allNormal(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "İletmek istediğiniz notu yazınız",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onTap: () {
                    setState(() {
                      isActive = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      gelenNot = value;
                    });
                  },
                  maxLines: 10,
                  textInputAction: TextInputAction.done,
                  controller: soru1,
                  decoration: InputDecoration(
                    labelText: "Notunuz",
                    hintText: "Notunuzu Yazınız",
                    labelStyle: TextStyle(
                      color: isActive == false
                          ? kMyPrimaryColor
                          : kMyPrimaryTextColor,
                    ),
                    helperText: soru1.value.text.isNotEmpty == false
                        ? "Boş Bırakılamaz"
                        : "",
                    helperStyle: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 160),
            DefaultButton(
              text: "Kaydet",
              press: isActive == false
                  ? null
                  : () {
                      if (soru1.value.text.isNotEmpty) {
                      } else {}
                    },
            ),
          ],
        ),
      ),
    );
  }
}
