// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../project/widgets/app_bar_widget.dart';
import '../model/kelime_model.dart';
import '../utils/db_helper.dart';
import 'tabs/ana_sayfa_tab.dart';
import 'tabs/ayarlar.dart';
import 'tabs/kelime_klavuzu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = MyDatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController trKelimeController = TextEditingController();
  TextEditingController engKelimeController = TextEditingController();
  TextEditingController kaydedilsinMiController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController trUpdateController = TextEditingController();
  TextEditingController engUpdateController = TextEditingController();
  TextEditingController kaydedilsinMiUpdateController = TextEditingController();
  TextEditingController idDeleteController = TextEditingController();

  List<KelimeModel> kelimeModel_ = [];
  List<KelimeModel> carByName = [];

  @override
  void initState() {
    super.initState();
    dbHelper.queryAllRows();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Ezberlemeye hazır mısın?"),
          leading: const SizedBox(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/home_home.svg",
                  width: 24,
                  height: 24,
                ),
                child: Text(
                  "Ana Sayfa",
                  style: costumtextStyle(),
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/home_guide.svg",
                  width: 24,
                  height: 24,
                ),
                child: Text(
                  "Klavuz",
                  style: costumtextStyle(),
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/home_settings.svg",
                  width: 24,
                  height: 24,
                ),
                child: Text(
                  "Ayarlar",
                  style: costumtextStyle(),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [AnaSayfaTab(), KelimeKlavuzu(), AyarSayfasi()],
        ),
      ),
    );
  }

  TextStyle costumtextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  // void _delete(int id) async {
  //   final rowsDeleted = await dbHelper.delete(id);
  //   //_showMessageInScaffold("deleed $rowsDeleted row(s) $id");
  //   print(rowsDeleted);
  // }

  // void _update(
  //     int id, String trKelimee, String engKelimee, int kayitOlsunMu) async {
  //   KelimeModel kelime = KelimeModel(id, trKelimee, engKelimee, kayitOlsunMu);
  //   final rowAffected = await dbHelper.update(kelime);
  //   print(rowAffected);
  //   //_showMessageInScaffold("güncellendi $rowAffected ");
  // }

  // void _insert(
  //     String myTrKelime, String myEngKelime, int myKaydedilsinMi) async {
  //   Map<String, dynamic> row = {
  //     MyDatabaseHelper.columnTr: myTrKelime,
  //     MyDatabaseHelper.columnEng: myEngKelime,
  //     MyDatabaseHelper.columnKayit: myKaydedilsinMi
  //   };

  // KelimeModel kelimeModel = KelimeModel.fromMap(row);
  // final id = await dbHelper.insert(kelimeModel);
  // print(id);
  //   //_showMessageInScaffold("insert row id: $id");
  // }

  // void _query(String name) async {
  //   final allRows = await dbHelper.queryRows(name);
  //   carByName.clear();
  //   allRows?.forEach((element) => carByName.add(KelimeModel.fromMap(element)));
  // }

  // void _queryAll() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   kelimeModel_.clear();
  //   allRows
  //       ?.forEach((element) => kelimeModel_.add(KelimeModel.fromMap(element)));
  //   //_showMessageInScaffold("Query done.");
  //   setState(() {});
  // }
}
