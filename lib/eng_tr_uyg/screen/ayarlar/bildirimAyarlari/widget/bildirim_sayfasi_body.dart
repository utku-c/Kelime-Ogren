import 'package:flutter/material.dart';

import '../../../../../project/constant/constant.dart';

class BildirimSayfasiBody extends StatefulWidget {
  const BildirimSayfasiBody({Key? key}) : super(key: key);

  @override
  State<BildirimSayfasiBody> createState() => _BildirimSayfasiBodyState();
}

class _BildirimSayfasiBodyState extends State<BildirimSayfasiBody> {
  bool _duyurular = true;
  bool _aprtMesajlari = false;
  bool _aidatHatirlatma = true;
  bool _yapilanCalismalar = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allNormal(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bu Bildirimlere İzin Ver",
                style: kMyTextDecoration.copyWith(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                _aidatHatirlatma = !_aidatHatirlatma;
              });
            },
            child: Container(
              decoration: kMyDefaultBoxDecoration,
              padding: const PagePadding.symtcHrztNormal(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Yeni Kelimeler Bildirimi",
                    style: kMyTextDecoration.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Checkbox(
                    value: _aidatHatirlatma,
                    onChanged: ((value) {
                      if (value != null) {
                        setState(() {
                          _aidatHatirlatma = value;
                        });
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _aprtMesajlari = !_aprtMesajlari;
              });
            },
            child: Container(
              decoration: kMyDefaultBoxDecoration,
              padding: const PagePadding.symtcHrztNormal(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Duyurular",
                    style: kMyTextDecoration.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Checkbox(
                    value: _aprtMesajlari,
                    onChanged: ((value) {
                      if (value != null) {
                        setState(() {
                          _aprtMesajlari = value;
                        });
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _duyurular = !_duyurular;
              });
            },
            child: Container(
              decoration: kMyDefaultBoxDecoration,
              padding: const PagePadding.symtcHrztNormal(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "null",
                    style: kMyTextDecoration.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Checkbox(
                    value: _duyurular,
                    onChanged: ((value) {
                      if (value != null) {
                        setState(() {
                          _duyurular = value;
                        });
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _yapilanCalismalar = !_yapilanCalismalar;
              });
            },
            child: Container(
              decoration: kMyDefaultBoxDecoration,
              padding: const PagePadding.symtcHrztNormal(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "null",
                    style: kMyTextDecoration.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Checkbox(
                    value: _yapilanCalismalar,
                    onChanged: ((value) {
                      if (value != null) {
                        setState(() {
                          _yapilanCalismalar = value;
                        });
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
