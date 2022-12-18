class WordModel {
  String? word;
  List<Results>? results;
  Syllables? syllables;
  Pronunciation? pronunciation;
  double? frequency;

  WordModel({word, results, syllables, pronunciation, frequency});

  WordModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    syllables = json['syllables'] != null
        ? Syllables.fromJson(json['syllables'])
        : null;
    pronunciation = json['pronunciation'] != null
        ? Pronunciation.fromJson(json['pronunciation'])
        : null;
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (syllables != null) {
      data['syllables'] = syllables!.toJson();
    }
    if (pronunciation != null) {
      data['pronunciation'] = pronunciation!.toJson();
    }
    data['frequency'] = frequency;
    return data;
  }
}

class Results {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? examples;

  Results({definition, partOfSpeech, synonyms, typeOf, examples});

  Results.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    partOfSpeech = json['partOfSpeech'];
    synonyms = json['synonyms'].cast<String>();
    typeOf = json['typeOf'].cast<String>();
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['partOfSpeech'] = partOfSpeech;
    data['synonyms'] = synonyms;
    data['typeOf'] = typeOf;
    data['examples'] = examples;
    return data;
  }
}

class Syllables {
  int? count;
  List<String>? list;

  Syllables({count, list});

  Syllables.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['list'] = list;
    return data;
  }
}

class Pronunciation {
  String? all;

  Pronunciation({all});

  Pronunciation.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
