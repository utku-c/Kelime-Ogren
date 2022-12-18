import 'dart:io';

import 'package:dio/dio.dart';

import '../../eng_tr_uyg/model/ornek_kelime_bul.dart';

abstract class IReqresService {
  final Dio dio;
  IReqresService(this.dio);
  Future<OrnekCumleBulModel?> fetchHavaDurumuIte(String kelimee);
}

class ReqresService extends IReqresService {
  ReqresService(
    super.dio,
  );

  @override
  Future<OrnekCumleBulModel?> fetchHavaDurumuIte(String kelimee) async {
    final response = await dio.get(
        "https://wordsapiv1.p.rapidapi.com/words/$kelimee/examples",
        options: Options(headers: {
          "X-RapidAPI-Key":
              "4d0a8a2967mshe37232d5cdea211p193d59jsnbcaa589db7e1",
          "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com",
        }));

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return OrnekCumleBulModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
