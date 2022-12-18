import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

import '../../../../project/widgets/app_bar_widget.dart';
import '../../../../project/widgets/list_card.dart';
import '../../../model/kelime_model.dart';
import '../../../utils/db_helper.dart';

class KelimeListeSayfasi extends StatefulWidget {
  const KelimeListeSayfasi({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeListeSayfasi> createState() => _KelimeListeSayfasiState();
}

class _KelimeListeSayfasiState extends State<KelimeListeSayfasi> {
  @override
  void initState() {
    super.initState();
    isOk = false;
    _queryAll();

    isOk = true;
  }

  bool isOk = true;
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
      body: isOk == true
          ? Padding(
              padding: const PagePadding.allNormal(),
              child: ListView.builder(
                itemCount: carByName.length,
                itemBuilder: ((context, index) {
                  // return Text(carByName[index].id.toString());
                  return ListCard(
                    kelimeModel: carByName[index],
                  );
                }),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: kMyPrimaryColor,
              ),
            ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Container(
          width: 100,
          height: 50,
          color: kMyPrimaryColor,
          child: const Text(
            "Güncelle",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    carByName.clear();
    allRows?.forEach(
      (element) => carByName.add(
        KelimeModel.fromMap(element),
      ),
    );
  }
}
