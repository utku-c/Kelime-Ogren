// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';
import 'package:tcard/tcard.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/kelime_model.dart';
import '../../../utils/db_helper.dart';
import '../widget/kelime_cart.dart';
import '../widget/t_card_button.dart';

class KelimeSayfasi extends StatefulWidget {
  const KelimeSayfasi({Key? key, required this.baslik}) : super(key: key);
  final String baslik;

  @override
  State<KelimeSayfasi> createState() => _KelimeSayfasiState();
}

class _KelimeSayfasiState extends State<KelimeSayfasi> {
  final dbHelper = MyDatabaseHelper.instance;
  final TCardController _controller = TCardController();

  final List<KelimeModel> kelimeModel = [];

  List<Widget> ezberlenmisKelime = [];
  List<Widget> ezberlenmemisKelime = [];
  List<Widget> tCardList = [
    const KelimeKart(
      trKelime: "Ve Başla",
      engKelime: "Sıfırla Butonuna Bas",
    )
  ];
  bool isComplated = true;

  @override
  void initState() {
    super.initState();
    change();
    _queryAll();
    change();
  }

  void change() {
    setState(() {
      isComplated = !isComplated;
    });
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    kelimeModel.clear();
    allRows?.forEach(
      (element) => kelimeModel.add(
        KelimeModel.fromMap(element),
      ),
    );

    setState(() {});
    if (kelimeModel.isNotEmpty) {
      tCardList = List.generate(
        kelimeModel.length,
        (index) => KelimeKart(
          trKelime: kelimeModel[index].trKelime,
          engKelime: kelimeModel[index].engKelime,
        ),
      );
    } else {
      tCardList = [
        Container(
          color: kMyPrimaryTextColor,
          child: const Text("Tekrar Giriş Yapınız"),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: const Text("Kelime Ezberle"),
      ),
      body: isComplated == true
          ? Center(
              child: Padding(
                padding: const PagePadding.allLow(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TCard(
                      cards: tCardList,
                      size: const Size(double.infinity, 200),
                      controller: _controller,
                      onForward: (index, info) {
                        // print(index);
                        // print(info.direction);

                        if (info.direction == SwipDirection.Right) {
                          ezberlenmisKelime.add(tCardList[index - 1]);
                          print('Ezberlendi');
                        } else {
                          print('Ezberlenmedi');
                          ezberlenmemisKelime.add(tCardList[index - 1]);
                        }
                      },
                      onBack: (index, info) {
                        print(tCardList[index]);
                        print(info.direction);
                        if (info.direction == SwipDirection.None) {
                          ezberlenmemisKelime.remove(tCardList[index]);
                          ezberlenmisKelime.remove(tCardList[index]);
                        } else if (info.direction == SwipDirection.Left) {
                          ezberlenmemisKelime.remove(tCardList[index]);
                        } else if (info.direction == SwipDirection.Right) {
                          ezberlenmisKelime.remove(tCardList[index]);
                        }
                      },
                      onEnd: () {
                        print('Bitti');
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        TCardButton(
                          functuon: () {
                            _controller.back();
                          },
                          isActive: false,
                          name: "Geri Getir",
                        ),
                        TCardButton(
                          isActive: true,
                          name: "Sıfırla",
                          functuon: (() {
                            _controller.reset();
                          }),
                        ),
                        TCardButton(
                          name: "Rastgele İlerle",
                          isActive: false,
                          functuon: (() {
                            _controller.forward();
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: kMyPrimaryColor,
              ),
            ),
    );
  }
}
