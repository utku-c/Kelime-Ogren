class TanimModel {
  String? word;
  List<Definitions>? definitions;

  TanimModel({word, definitions});

  TanimModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String? definition;
  String? partOfSpeech;

  Definitions({definition, partOfSpeech});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    partOfSpeech = json['partOfSpeech'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['partOfSpeech'] = partOfSpeech;
    return data;
  }
}
