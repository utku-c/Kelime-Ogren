import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../project/constant/constant.dart';
import '../../../project/manager/navigator_manager.dart';
import '../../model/sayfalar.dart';
import '../kelime_klavuzu_detay/screens/es_anlamli_bul.dart';
import '../kelime_klavuzu_detay/screens/kelime_detaylar.dart';
import '../kelime_klavuzu_detay/screens/kelime_klavuzu_ekran.dart';
import '../kelime_klavuzu_detay/screens/kelime_tanim_bul.dart';
import '../kelime_klavuzu_detay/screens/ornek_cumle_bul.dart';

class KelimeKlavuzu extends StatefulWidget {
  const KelimeKlavuzu({Key? key}) : super(key: key);

  @override
  State<KelimeKlavuzu> createState() => _KelimeKlavuzuState();
}

class _KelimeKlavuzuState extends State<KelimeKlavuzu> {
  final NavigatorManager _manager = NavigatorManager();

  List<Sayfa> gidilecekSayfalar = [
    Sayfa(
      name: "Kelime Klavuzu Arama",
      imageUrl: "assets/icons/klavuz_synonym.svg",
    ),
    Sayfa(
      name: "Eş Anlamlı Kelimeleri Bul",
      imageUrl: "assets/icons/klavuz_synonym.svg",
    ),
    Sayfa(
      name: "Örnek Cümle Bul",
      imageUrl: "assets/icons/klavuz_example.svg",
    ),
    Sayfa(
      name: "Kelime Detayları Bulma",
      imageUrl: "assets/icons/klavuz_details.svg",
    ),
    Sayfa(
      name: "Kelime Tanım Bulma",
      imageUrl: "assets/icons/klavuz_tanim.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              gidilecekSayfalar.length,
              ((index) => GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          _manager.navigatToWidget(
                            context,
                            KelimeKlavuzuEkran(
                              baslik: gidilecekSayfalar[index].name,
                            ),
                          );
                          break;
                        case 1:
                          _manager.navigatToWidget(
                            context,
                            EsAnlamBulEkran(
                              baslik: gidilecekSayfalar[index].name,
                            ),
                          );
                          break;
                        case 2:
                          _manager.navigatToWidget(
                            context,
                            const OrnekCumleBul(),
                          );
                          break;
                        case 3:
                          _manager.navigatToWidget(
                            context,
                            const KelimeDetaylariBulma(),
                          );
                          break;
                        case 4:
                          _manager.navigatToWidget(
                            context,
                            const KelimeTanimBul(),
                          );
                          break;

                        default:
                      }
                    },
                    child: Padding(
                      padding: const PagePadding.allNormal(),
                      child: Container(
                        decoration: kMyDefaultBoxDecoration.copyWith(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              gidilecekSayfalar[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SvgPicture.asset(
                              gidilecekSayfalar[index].imageUrl,
                              width: 60,
                              height: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
