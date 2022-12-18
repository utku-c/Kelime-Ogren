// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../../project/constant/constant.dart';
import '../../../../project/constant/default_button.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/kelime_model.dart';
import '../../../utils/db_helper.dart';

class KelimeGuncelle extends StatefulWidget {
  const KelimeGuncelle({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeGuncelle> createState() => _KelimeGuncelleState();
}

class _KelimeGuncelleState extends State<KelimeGuncelle> {
  final dbHelper = MyDatabaseHelper.instance;
  TextEditingController trKelimeController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController engKelimeController = TextEditingController();
  TextEditingController kaydedilsinMiController = TextEditingController();
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
                      controller: idController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "id",
                        hintText: "id giriniz",
                      ),
                    ),
                  ),
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
                text: "Güncelle",
                press: () {
                  if (trKelimeController.text.isNotEmpty &&
                      engKelimeController.text.isNotEmpty &&
                      kaydedilsinMiController.text.isNotEmpty &&
                      idController.text.isNotEmpty) {
                    String trKelime = trKelimeController.text;
                    String engKelime = engKelimeController.text;
                    int kaydedilsinMi = int.parse(
                      kaydedilsinMiController.text,
                    );
                    int id = int.parse(
                      idController.text,
                    );
                    _update(id, trKelime, engKelime, kaydedilsinMi);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Kelime Güncellendi'),
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

  void _update(
    int id,
    String trKelimee,
    String engKelimee,
    int kayitOlsunMu,
  ) async {
    KelimeModel kelime = KelimeModel(id, trKelimee, engKelimee, kayitOlsunMu);
    final rowAffected = await dbHelper.update(kelime);
    print(rowAffected);
    //_showMessageInScaffold("güncellendi $rowAffected ");
  }
}
