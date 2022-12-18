import 'package:flutter/material.dart';

import '../../../../../project/constant/constant.dart';
import '../../../../../project/enum/dil_enum.dart';
import '../../../../../project/widgets/my_diriver.dart';

class DilSecenekleriSayfasiBody extends StatefulWidget {
  const DilSecenekleriSayfasiBody({Key? key}) : super(key: key);

  @override
  State<DilSecenekleriSayfasiBody> createState() =>
      _DilSecenekleriSayfasiBodyState();
}

class _DilSecenekleriSayfasiBodyState extends State<DilSecenekleriSayfasiBody> {
  String seciliDil = DilSecenek.tr.displayTitle;
  int seciliIndex = 1;
  bool isSelected = true;
  bool isComplated = true;
  List<String> dilAd = [];
  @override
  void initState() {
    listeYap();
    super.initState();
  }

  void change() {
    setState(() {
      isComplated = !isComplated;
    });
  }

  void listeYap() {
    change();
    for (var element in DilSecenek.values) {
      dilAd.add(element.displayTitle);
    }
    change();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allNormal(),
      child: Column(
        children: [
          Text(
            "Seçili Dil : ${dilAd[seciliIndex]}",
            style: kMyTextDecoration,
          ),
          const MyDiriver(),
          Expanded(
            child: isComplated == true
                ? ListView.builder(
                    itemCount: dilAd.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            seciliIndex = index;
                          },
                          child: Container(
                            decoration: kMyDefaultBoxDecoration,
                            padding: const PagePadding.symtcHrztNormal(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dilAd[index],
                                  style: kMyTextDecoration.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                Checkbox(
                                  value:
                                      seciliIndex == index ? isSelected : false,
                                  onChanged: ((value) {
                                    if (value != null) {
                                      setState(() {
                                        seciliIndex = index;
                                      });
                                    }
                                  }),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
