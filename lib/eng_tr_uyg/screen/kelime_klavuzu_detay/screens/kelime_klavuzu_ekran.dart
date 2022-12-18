import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_learn/project/constant/constant.dart';

import '../../../../istek/model/kelime_model.dart';
import '../../../../istek/service/reqres_service.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../widget/divider_with_widget.dart';

class KelimeKlavuzuEkran extends StatefulWidget {
  const KelimeKlavuzuEkran({Key? key, required this.baslik}) : super(key: key);
  final String baslik;
  @override
  State<KelimeKlavuzuEkran> createState() => _KelimeKlavuzuEkranState();
}

class _KelimeKlavuzuEkranState extends State<KelimeKlavuzuEkran> {
  late final IReqresService reqresService;
  // List<Results> resources = [];
  // WordModel? wordModel;
  WordModel? wordModel;
  // List<WordModel> wordModel = [];
  bool isLoading = true;
  // String aranacakKelime = "example";
  String aranacakKelime = "hello";
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(
      Dio(),
      aranacakKelime,
    );
    fetch();
  }

  Future<void> fetch() async {
    _changeLoading();
    wordModel = await reqresService.fetchHavaDurumuIte();

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
        title: Text(widget.baslik),
      ),
      body: isLoading == false
          ? const Center(
              child: CircularProgressIndicator(
                color: kMyPrimaryColor,
              ),
            )
          : Padding(
              padding: const PagePadding.allNormal(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (wordModel == null) const Text("Sistem Hatası Mevcut"),
                    if (wordModel != null)
                      Container(
                        width: double.infinity,
                        color: kMyPrimaryTextColor.withOpacity(0.7),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Word - Kelime",
                              style: kMyTextDecoration,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              wordModel?.word ?? "Bulunamadı",
                              style: textStyle(),
                            ),
                            paddingAndDivider(),
                            const Text(
                              "Definition - Tanım",
                              style: kMyTextDecoration,
                            ),
                            const SizedBox(height: 12),
                            if (wordModel?.results?[0].definition != null)
                              Text(
                                wordModel?.results?[0].definition.toString() ??
                                    "",
                                style: textStyle(),
                              ),
                            paddingAndDivider(),
                            const Text(
                              "frequency - Sıklık",
                              style: kMyTextDecoration,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              wordModel?.frequency.toString() ?? "Bulunamadı",
                              style: textStyle(),
                            ),
                            paddingAndDivider(),
                            const Text(
                              "pronunciation - Telaffuz",
                              style: kMyTextDecoration,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              wordModel?.pronunciation?.all ?? "Bulunamadı",
                              style: textStyle(),
                            ),
                            paddingAndDivider(),
                            const Text(
                              "syllables - Heceler",
                              style: kMyTextDecoration,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              wordModel?.syllables?.count.toString() ??
                                  "Bulunamadı",
                              style: textStyle(),
                            ),
                            if (wordModel?.syllables?.count != null)
                              for (int i = 0;
                                  i < wordModel!.syllables!.list!.length;
                                  i++)
                                Text(
                                  wordModel!.syllables!.list![i],
                                  style: textStyle(),
                                ),
                            paddingAndDivider(),
                            const Text(
                              "Part Of Speech",
                              style: kMyTextDecoration,
                            ),
                            Text(
                              wordModel?.results?[0].partOfSpeech ?? "",
                              style: textStyle(),
                            ),
                            paddingAndDivider(),
                            const Text(
                              "Synonyms - Eş Anlamlıları",
                              style: kMyTextDecoration,
                            ),
                            if (wordModel != null)
                              if (wordModel?.results != null)
                                for (int i = 0;
                                    i < wordModel!.results![0].synonyms!.length;
                                    i++)
                                  Text(
                                    wordModel!.results![0].synonyms![i],
                                    style: textStyle(),
                                  ),
                            paddingAndDivider(),
                            const Text(
                              "typeOf - Bir Çeşit",
                              style: kMyTextDecoration,
                            ),
                            if (wordModel != null)
                              if (wordModel?.results != null)
                                for (int i = 0;
                                    i < wordModel!.results![0].typeOf!.length;
                                    i++)
                                  Text(
                                    wordModel!.results![0].typeOf![i],
                                    style: textStyle(),
                                  ),
                            paddingAndDivider(),
                            const Text(
                              "examples - Örnekler",
                              style: kMyTextDecoration,
                            ),
                            if (wordModel != null)
                              if (wordModel?.results != null)
                                for (int i = 0;
                                    i < wordModel!.results![0].examples!.length;
                                    i++)
                                  Text(
                                    wordModel!.results![0].examples![i],
                                    style: textStyle(),
                                  ),
                            paddingAndDivider(),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  Padding paddingAndDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: DividerWithTextWidget(
        text: ' 0 ',
      ),
    );
  }
}
