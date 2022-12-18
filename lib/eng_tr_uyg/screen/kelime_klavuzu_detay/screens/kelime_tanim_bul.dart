import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../istek/service/tanim_bul_servis.dart';
import '../../../../project/constant/constant.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/tanimlar_model.dart';

class KelimeTanimBul extends StatefulWidget {
  const KelimeTanimBul({Key? key}) : super(key: key);

  @override
  State<KelimeTanimBul> createState() => _KelimeTanimBulState();
}

class _KelimeTanimBulState extends State<KelimeTanimBul> {
  final TextEditingController _arananKlmController = TextEditingController();
  late final IReqresService reqresService;
  String aranacakKelime = "book";

  TanimModel? tanimModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(
      Dio(),
    );
    fetch();
  }

  Future<void> fetch() async {
    _changeLoading();
    tanimModel = await reqresService.fetchHavaDurumuIte(aranacakKelime);
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: const Text("Kelime Tanım Bul"),
      ),
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Kelime: $aranacakKelime",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading == true
                  ? ListView.builder(
                      itemCount: tanimModel?.definitions?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: containerValues(index),
                        );
                      }),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: kMyPrimaryColor,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: textFromField(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: sendButton(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container containerValues(int index) {
    return Container(
      decoration: BoxDecoration(
        color: kMyPrimaryTextColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tanimModel?.definitions?[index].definition ?? "",
            ),
            Text(
              tanimModel?.definitions?[index].partOfSpeech ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center sendButton() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: MyBorderRadius.circularHigh(),
          color: kMyPrimaryColor,
        ),
        child: IconButton(
          splashColor: Colors.red,
          icon: const Icon(
            Icons.send_sharp,
            size: 30,
            color: kMyPrimaryTextColor,
          ),
          onPressed: () {
            if (_arananKlmController.text.isNotEmpty) {
              aranacakKelime = _arananKlmController.text;

              fetch();
              setState(() {});
              _arananKlmController.clear();
              FocusManager.instance.primaryFocus?.unfocus();
            } else {}
          },
        ),
      ),
    );
  }

  TextFormField textFromField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: _arananKlmController,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (value) {},
      onChanged: (value) {
        if (value.length >= 3) {}
      },
      onSaved: (newValue) {},
      cursorColor: kMyPrimaryColor,
      style: const TextStyle(
        color: kMyPrimaryColor,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        hintText: "Kelime Tanımı Ara",
        labelText: "Ara",
      ),
    );
  }
}
