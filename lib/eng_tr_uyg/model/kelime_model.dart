import '../utils/db_helper.dart';

class KelimeModel {
  int? id;
  String? engKelime;
  String? trKelime;
  int? kaydedilsinMi;
  KelimeModel(
    this.id,
    this.engKelime,
    this.trKelime,
    this.kaydedilsinMi,
  );

  KelimeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    engKelime = map['engKelime'];
    trKelime = map['trKelime'];
    kaydedilsinMi = map['kaydedilsinMi'];
  }
  Map<String, dynamic> toMap() {
    return {
      MyDatabaseHelper.columnId: id,
      MyDatabaseHelper.columnEng: engKelime,
      MyDatabaseHelper.columnTr: trKelime,
      MyDatabaseHelper.columnKayit: kaydedilsinMi,
    };
  }
}





























 // KelimeModel({this.id, this.engKelime, this.trKelime, this.kaydedilsinMi});

  // KelimeModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   engKelime = json['engKelime'];
  //   trKelime = json['trKelime'];
  //   kaydedilsinMi = json['kaydedilsinMi'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['engKelime'] = engKelime;
  //   data['trKelime'] = trKelime;
  //   data['kaydedilsinMi'] = kaydedilsinMi;
  //   return data;
  // }