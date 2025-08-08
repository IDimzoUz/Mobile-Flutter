class ContractsTemplatesResponse {
  int? id;
  String? name;
  List<Translations>? translations;
  String? createdAt;
  String? updatedAt;

  ContractsTemplatesResponse({this.id, this.name, this.translations, this.createdAt, this.updatedAt});

  ContractsTemplatesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Translations {
  int? id;
  String? languageCode;
  String? content;
  List<Sections>? sections;
  String? createdAt;
  String? updatedAt;

  Translations(
      {this.id,
        this.languageCode,
        this.content,
        this.sections,
        this.createdAt,
        this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['languageCode'];
    content = json['content'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['languageCode'] = languageCode;
    data['content'] = content;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Sections {
  int? id;
  String? name;
  int? orderIndex;
  List<Fields>? fields;

  Sections({this.id, this.name, this.orderIndex, this.fields});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderIndex = json['orderIndex'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['orderIndex'] = orderIndex;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  int? id;
  String? name;
  String? fieldId;
  String? fieldType;
  bool? required;
  double? minValue;
  double? maxValue;
  int? minLength;
  int? maxLength;
  String? pattern;
  List<String>? options;
  int? orderIndex;
  String? placeholder;
  String? helpText;

  Fields(
      {this.id,
        this.name,
        this.fieldId,
        this.fieldType,
        this.required,
        this.minValue,
        this.maxValue,
        this.minLength,
        this.maxLength,
        this.pattern,
        this.options,
        this.orderIndex,
        this.placeholder,
        this.helpText});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fieldId = json['fieldId'];
    fieldType = json['fieldType'];
    required = json['required'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
    pattern = json['pattern'];
    options = json['options'].cast<String>();
    orderIndex = json['orderIndex'];
    placeholder = json['placeholder'];
    helpText = json['helpText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['fieldId'] = fieldId;
    data['fieldType'] = fieldType;
    data['required'] = required;
    data['minValue'] = minValue;
    data['maxValue'] = maxValue;
    data['minLength'] = minLength;
    data['maxLength'] = maxLength;
    data['pattern'] = pattern;
    data['options'] = options;
    data['orderIndex'] = orderIndex;
    data['placeholder'] = placeholder;
    data['helpText'] = helpText;
    return data;
  }
}
