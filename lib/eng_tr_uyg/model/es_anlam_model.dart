class EsAnlamModel {
  String? word;
  List<String>? synonyms;

  EsAnlamModel({this.word, this.synonyms});

  EsAnlamModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['synonyms'] = synonyms;
    return data;
  }
}
