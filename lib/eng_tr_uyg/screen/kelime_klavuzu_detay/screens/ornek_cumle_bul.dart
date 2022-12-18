import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../istek/service/cumle_bul.dart';
import '../../../../project/constant/constant.dart';
import '../../../../project/widgets/app_bar_widget.dart';
import '../../../model/ornek_kelime_bul.dart';

class OrnekCumleBul extends StatefulWidget {
  const OrnekCumleBul({Key? key}) : super(key: key);

  @override
  State<OrnekCumleBul> createState() => _OrnekCumleBulState();
}

class _OrnekCumleBulState extends State<OrnekCumleBul> {
  final TextEditingController _arananKlmController = TextEditingController();
  late final IReqresService reqresService;

  OrnekCumleBulModel? ornekCumleBulModel;
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
    ornekCumleBulModel = await reqresService.fetchHavaDurumuIte(aranacakKelime);
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
        title: const Text("Örnek Cümle Ara"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: isLoading == true
                  ? ListView.builder(
                      itemCount: ornekCumleBulModel?.examples?.length ?? 0,
                      itemBuilder: ((context, index) {
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ornekCumleBulModel?.examples?[index] ?? "",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                    child: Center(
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
                    ),
                  )
                ],
              ),
            ),
          ],
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
        hintText: "Eş Anlamlı Kelime Ara",
        labelText: "Ara",
      ),
    );
  }
}
