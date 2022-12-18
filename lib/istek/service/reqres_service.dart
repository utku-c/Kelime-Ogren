// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';

import '../model/kelime_model.dart';

abstract class IReqresService {
  final Dio dio;
  IReqresService(this.dio);
  Future<WordModel?> fetchHavaDurumuIte();
}

class ReqresService extends IReqresService {
  ReqresService(
    super.dio,
    this.kelime,
  );
  final String kelime;
  @override
  Future<WordModel?> fetchHavaDurumuIte() async {
    final response =
        await dio.get("https://wordsapiv1.p.rapidapi.com/words/$kelime",
            options: Options(headers: {
              "X-RapidAPI-Key":
                  "4d0a8a2967mshe37232d5cdea211p193d59jsnbcaa589db7e1",
              "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com",
            }));

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      print(jsonBody);
      if (jsonBody is Map<String, dynamic>) {
        return WordModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
/*

 */