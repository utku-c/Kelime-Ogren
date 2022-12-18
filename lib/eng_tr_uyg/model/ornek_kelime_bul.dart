class OrnekCumleBulModel {
  String? word;
  List<String>? examples;

  OrnekCumleBulModel({this.word, this.examples});

  OrnekCumleBulModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['examples'] = examples;
    return data;
  }
}
