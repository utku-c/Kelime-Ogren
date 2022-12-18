import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/kelime_model.dart';
import '../../../utils/db_helper.dart';

class KelimeAra extends StatefulWidget {
  const KelimeAra({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeAra> createState() => _KelimeAraState();
}

class _KelimeAraState extends State<KelimeAra> {
  TextEditingController queryController = TextEditingController();
  final dbHelper = MyDatabaseHelper.instance;
  List<KelimeModel> carByName = [];

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
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: queryController,
                  decoration: const InputDecoration(
                    labelText: "Kelime Ara",
                    hintText: "Türkçe - İngilizce Kelime Ara",
                  ),
                  onChanged: (value) {
                    if (value.length >= 2) {
                      setState(() {
                        _query(value);
                      });
                    } else {
                      setState(() {
                        carByName.clear();
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: carByName.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          height: 60,
                          margin: const EdgeInsets.all(2),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kMyPrimaryTextColor,
                              borderRadius: BorderRadius.circular(
                                24,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kMyPrimaryColor,
                                    borderRadius: BorderRadius.circular(
                                      24,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${carByName[index].id}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "${carByName[index].engKelime}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _query(String name) async {
    final allRows = await dbHelper.queryRows(name);
    carByName.clear();
    allRows?.forEach((element) => carByName.add(KelimeModel.fromMap(element)));
  }
}
