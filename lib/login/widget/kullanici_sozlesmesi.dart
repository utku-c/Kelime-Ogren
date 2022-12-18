import 'package:flutter/material.dart';

import '../../eng_tr_uyg/screen/home_page.dart';
import '../../project/constant/constant.dart';
import '../../project/constant/default_button.dart';

class KullaniciSozlesmesi extends StatefulWidget {
  const KullaniciSozlesmesi({Key? key}) : super(key: key);

  @override
  State<KullaniciSozlesmesi> createState() => _KullaniciSozlesmesiState();
}

class _KullaniciSozlesmesiState extends State<KullaniciSozlesmesi> {
  bool? sozlesme = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                activeColor: kMyPrimaryColor,
                value: sozlesme,
                onChanged: (value) {
                  setState(() {
                    sozlesme = value;
                  });
                }),
            const Text(
              "Kullanıcı Sözleşmesi onayla",
              style: TextStyle(
                fontSize: kMyFontSizeSoLow,
              ),
            ),
            const Spacer(),
            GestureDetector(
              // onTap: (() => Navigator.pushNamed(
              //       context,
              //       ForgotPasswordScreen.routeName,
              //     )),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return const AlertDialog(
                          title: Text("Dikkat"),
                          content: Text(
                            "Bu uygulama Sakarya Üniversitesi Bilgisayar Mühendisliği bölümü Finansal Bilgi Teknolojileri dersi için geliştirilmiştir. Herhangi bir bilginizi işleme, kopyalama vs. gibi durumlar söz konusu değildir.",
                          ),
                          backgroundColor: kMyPrimaryTextColor,
                        );
                      }));
                },
                child: const Text(
                  "Oku",
                  style: TextStyle(
                    fontSize: kMyFontSizelow,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        DefaultButton(
          text: "Devam Et",
          press: sozlesme == true
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  // if (_fromKey.currentState != null &&
                  //     _fromKey.currentState!.validate()) {
                  //   _fromKey.currentState!.save();

                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomePage(),
                  //     ),
                  //   );
                  // }
                }
              : null,
        )
      ],
    );
  }
}
