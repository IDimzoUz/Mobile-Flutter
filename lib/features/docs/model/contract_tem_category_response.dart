class ContractTemplatesCategoryResponse {
  int? id;
  String? name;
  List<String>? availableLanguages;
  bool? isCheck;

  ContractTemplatesCategoryResponse({this.id, this.name, this.availableLanguages, this.isCheck = false});

  ContractTemplatesCategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    availableLanguages = json['availableLanguages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['availableLanguages'] = availableLanguages;
    return data;
  }
}
