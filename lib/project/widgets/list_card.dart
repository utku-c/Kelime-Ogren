import 'package:flutter/material.dart';
import 'package:sqflite_learn/eng_tr_uyg/model/kelime_model.dart';

import '../constant/constant.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.kelimeModel,
  }) : super(key: key);
  final KelimeModel kelimeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kMyPrimaryTextColor,
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: double.infinity,
              decoration: BoxDecoration(
                color: kMyPrimaryColor,
                borderRadius: BorderRadius.circular(
                  24,
                ),
              ),
              child: Center(
                child: Text(
                  "${kelimeModel.id}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "${kelimeModel.engKelime}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
