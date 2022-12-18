import 'package:flutter/material.dart';

import '../../../../project/constant/constant.dart';
import '../../../../project/widgets/app_bar_widget.dart';

class KelimeDetaylariBulma extends StatefulWidget {
  const KelimeDetaylariBulma({Key? key}) : super(key: key);

  @override
  State<KelimeDetaylariBulma> createState() => _KelimeDetaylariBulmaState();
}

class _KelimeDetaylariBulmaState extends State<KelimeDetaylariBulma> {
  //  late final IReqresService reqresService;
  // final TextEditingController _arananKlmController = TextEditingController();
  // String aranacakKelime = "love";
  // @override
  // void initState() {
  //   super.initState();
  //   reqresService = ReqresService(
  //     Dio(),
  //   );
  //   fetch();
  // }

  // Future<void> fetch() async {
  //   _changeLoading();
  //   esAnlamModel = await reqresService.fetchHavaDurumuIte(aranacakKelime);
  //   _changeLoading();
  // }

  // void _changeLoading() {
  //   setState(() {
  //     isLoading = !isLoading;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingWidget(),
        leadingWidth: 90,
        title: const Text("Kelime Ara"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
            // if (_arananKlmController.text.isNotEmpty) {
            //   aranacakKelime = _arananKlmController.text;

            //   //fetch();
            //   setState(() {});
            //   _arananKlmController.clear();
            //   FocusManager.instance.primaryFocus?.unfocus();
            // } else {}
          },
        ),
      ),
    );
  }

  TextFormField textFromField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      //controller: _arananKlmController,
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
