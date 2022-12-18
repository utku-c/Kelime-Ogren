import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';
import 'package:sqflite_learn/project/manager/navigator_manager.dart';

import '../../model/sayfalar.dart';
import '../ana_sayfa_detay/screens/butun_kelimeler_getir.dart';
import '../ana_sayfa_detay/screens/kelime_ara.dart';
import '../ana_sayfa_detay/screens/kelime_ekle.dart';
import '../ana_sayfa_detay/screens/kelime_guncelle.dart';
import '../ana_sayfa_detay/screens/kelime_sayfasi.dart';
import '../ana_sayfa_detay/screens/kelime_sil.dart';
import '../ana_sayfa_detay/screens/rastgele_kelime.dart';

class AnaSayfaTab extends StatefulWidget {
  const AnaSayfaTab({Key? key}) : super(key: key);

  @override
  State<AnaSayfaTab> createState() => _AnaSayfaTabState();
}

class _AnaSayfaTabState extends State<AnaSayfaTab> {
  final NavigatorManager _manager = NavigatorManager();

  void sayfaGetir(int index) {
    switch (index) {
      case 0:
        _manager.navigatToWidget(
          context,
          KelimeSayfasi(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 1:
        _manager.navigatToWidget(
          context,
          KelimeSayfasi(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 2:
        _manager.navigatToWidget(
          context,
          KelimeSayfasi(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 3:
        _manager.navigatToWidget(
          context,
          RastgeleKelime(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 4:
        _manager.navigatToWidget(
          context,
          KelimeEkle(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 5:
        _manager.navigatToWidget(
          context,
          KelimeSil(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 6:
        _manager.navigatToWidget(
          context,
          KelimeGuncelle(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 7:
        _manager.navigatToWidget(
          context,
          KelimeAra(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      case 8:
        _manager.navigatToWidget(
          context,
          KelimeListeSayfasi(
            baslik: gidilecekSayfalar[index].name,
          ),
        );
        break;
      default:
    }
  }

  List<Sayfa> gidilecekSayfalar = [
    Sayfa(name: "Kelime Ezberle", imageUrl: "imageUrl"),
    Sayfa(name: "Ezberlenmiş Kelimeler", imageUrl: "imageUrl"),
    Sayfa(name: "Ezberlenmemiş Kelimeler", imageUrl: "imageUrl"),
    Sayfa(name: "Rastgele Kelime Getir", imageUrl: "imageUrl"),
    Sayfa(name: "Kelime EKle", imageUrl: "imageUrl"),
    Sayfa(name: "Kelime Sil", imageUrl: "imageUrl"),
    Sayfa(name: "Kelime Güncelle", imageUrl: "imageUrl"),
    Sayfa(name: "Kelime Ara", imageUrl: "imageUrl"),
  ];
  //Sayfa(name: "Bütün Kelimeler", imageUrl: "imageUrl"),
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
                      sayfaGetir(index);
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
