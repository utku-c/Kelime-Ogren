import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/widgets/my_diriver.dart';

import '../../../project/constant/constant.dart';
import '../../../project/manager/navigator_manager.dart';
import '../ayarlar/bildirimAyarlari/bildirim_sayfasi.dart';
import '../ayarlar/bize_ulasin/bize_ulas.dart';
import '../ayarlar/dil_secenekleri/dil_secenekleri_sayfasi.dart';
import '../ayarlar/hakkinda/hakkinda_sayfasi.dart';
import '../ayarlar/tema_ayarlari/tema_ayarlari.dart';
import '../ayarlar/widget/my_profile_item.dart';
import '../ayarlar/yardim/yardim_sayfasi.dart';

class AyarSayfasi extends StatefulWidget {
  const AyarSayfasi({Key? key}) : super(key: key);

  @override
  State<AyarSayfasi> createState() => _AyarSayfasiState();
}

class _AyarSayfasiState extends State<AyarSayfasi> {
  NavigatorManager manager = NavigatorManager();
  final TextEditingController _controller = TextEditingController();
  final String _svgUrl = "assets/icons/home_notification.svg";
  final String _svgUrlEmail = "assets/icons/email.svg";
  final String _svgUrlbildirim = "assets/icons/home_notification.svg";

  bool isChanced = false;
  bool durum = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            textFiledWidgets(),
            const SizedBox(height: 30),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Bütün Ayarlar",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const MyDiriver(),
            //*
            //* Bildirim Sayfası
            //*
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const BilDirimSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrlbildirim,
                text: "Bildirim Ayarları",
              ),
            ),
            const MyDiriver(),

            //*
            //* Tema Sayfası
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const TemaSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrl,
                text: "Tema",
              ),
            ),
            const MyDiriver(),
            //*
            //* Yardım
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const YardimSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrl,
                text: "Yardım",
              ),
            ),
            const MyDiriver(),
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const DilSecenekleriSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrl,
                text: "Dil Seçenekleri",
              ),
            ),
            const MyDiriver(),
            //*
            //* Bize Ulaşın
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const BizeUlasSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrlEmail,
                text: "Bize Ulaşın",
              ),
            ),
            const MyDiriver(),
            //*
            //* Hakkında
            GestureDetector(
              onTap: durum == false
                  ? () {
                      _showSnackBar();
                    }
                  : () {
                      manager.navigatToWidget(
                        context,
                        const HakkindaSayfasi(),
                      );
                    },
              child: MyProfileMenuItem(
                svgUrl: _svgUrl,
                text: "Hakkında",
              ),
            ),
            const MyDiriver(),
          ],
        ),
      ),
    );
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Güncelleniyor'),
        duration: const Duration(milliseconds: 2000),
        action: SnackBarAction(
          label: 'Kapat',
          onPressed: () {
            Navigator.of(context);
          },
        ),
      ),
    );
  }

  TextFormField textFiledWidgets() {
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.done,
      cursorColor: kMyPrimaryTextColor,
      style: const TextStyle(
        color: kMyPrimaryColor,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            isChanced = true;
          });
        }
        if (value.isEmpty) {
          setState(() {
            isChanced = false;
          });
        }
      },
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Arama Yapın",
        labelText: "Ara",
        suffixIcon: isChanced == false
            ? null
            : IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: const Icon(Icons.close),
                color: kMyPrimaryColor,
              ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.search,
            color: kMyPrimaryColor,
          ),
          //   child: CustomSuffixIcon(
          //     size: 36,
          //     svgIcon: "assets/icons/password.svg",
          //   ),
          // ),
        ),
      ),
    );
  }
}
