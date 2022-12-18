import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

import '../../../../project/constant/default_button.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/kelime_model.dart';
import '../../../utils/db_helper.dart';

class KelimeEkle extends StatefulWidget {
  const KelimeEkle({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeEkle> createState() => _KelimeEkleState();
}

class _KelimeEkleState extends State<KelimeEkle> {
  TextEditingController trKelimeController = TextEditingController();
  TextEditingController engKelimeController = TextEditingController();
  TextEditingController kaydedilsinMiController = TextEditingController();
  final dbHelper = MyDatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: Text(widget.baslik),
      ),
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: trKelimeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "tr kelime",
                        hintText: "Türkçe kelime",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: engKelimeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "eng kelime",
                        hintText: "İngilizce kelime",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: kaydedilsinMiController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "kaydedilsin mi",
                        hintText: "Kaydedilsin mi { 0 - 1 seç }",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              DefaultButton(
                text: "Ekle",
                press: () {
                  if (trKelimeController.text.isNotEmpty &&
                      engKelimeController.text.isNotEmpty &&
                      kaydedilsinMiController.text.isNotEmpty) {
                    String trKelime = trKelimeController.text;
                    String engKelime = engKelimeController.text;
                    int kaydedilsinMi = int.parse(
                      kaydedilsinMiController.text,
                    );
                    _insert(trKelime, engKelime, kaydedilsinMi);
                    trKelimeController.clear();
                    engKelimeController.clear();
                    kaydedilsinMiController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Kelime Eklendi'),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insert(
      String myTrKelime, String myEngKelime, int myKaydedilsinMi) async {
    Map<String, dynamic> row = {
      MyDatabaseHelper.columnTr: myTrKelime,
      MyDatabaseHelper.columnEng: myEngKelime,
      MyDatabaseHelper.columnKayit: myKaydedilsinMi
    };

    KelimeModel kelimeModel = KelimeModel.fromMap(row);
    await dbHelper.insert(kelimeModel);
  }
}
