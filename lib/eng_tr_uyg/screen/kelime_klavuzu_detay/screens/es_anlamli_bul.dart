import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

import '../../../../istek/service/es_anlam_service.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/es_anlam_model.dart';

class EsAnlamBulEkran extends StatefulWidget {
  const EsAnlamBulEkran({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<EsAnlamBulEkran> createState() => _EsAnlamBulEkranState();
}

class _EsAnlamBulEkranState extends State<EsAnlamBulEkran> {
  final TextEditingController _arananKlmController = TextEditingController();
  late final IReqresService reqresService;

  EsAnlamModel? esAnlamModel;
  bool isLoading = true;
  String aranacakKelime = "love";
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
    esAnlamModel = await reqresService.fetchHavaDurumuIte(aranacakKelime);
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: Text("Aranan Kelime: $aranacakKelime"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            const Text(
              "Benzer Kelimeler:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: isLoading == true
                  ? ListView.builder(
                      itemCount: esAnlamModel?.synonyms?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return listViewBuilderPadding(index);
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

  Padding listViewBuilderPadding(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kMyPrimaryTextColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 2,
          ),
          child: Text(
            esAnlamModel?.synonyms?[index] ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        hintText: "Benzer Kelime Ara",
        labelText: "Ara",
      ),
    );
  }
}
