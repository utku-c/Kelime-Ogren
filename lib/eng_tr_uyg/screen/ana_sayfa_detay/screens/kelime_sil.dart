import 'package:flutter/material.dart';

import '../../../../project/constant/constant.dart';
import '../../../../project/constant/default_button.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../utils/db_helper.dart';

class KelimeSil extends StatefulWidget {
  const KelimeSil({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeSil> createState() => _KelimeSilState();
}

class _KelimeSilState extends State<KelimeSil> {
  final dbHelper = MyDatabaseHelper.instance;
  TextEditingController idController = TextEditingController();

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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "id gir",
                  hintText: "silinecek kelimenin id'sini girin",
                ),
              ),
            ),
            DefaultButton(
              text: "Sil",
              press: () {
                if (idController.text.isNotEmpty) {
                  int id = int.parse(
                    idController.text,
                  );
                  _delete(id);
                  idController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _delete(int id) async {
    final rowsDeleted = await dbHelper.delete(id);
    //_showMessageInScaffold("deleed $rowsDeleted row(s) $id");
    print(rowsDeleted);
  }
}
