class NewsResponse {
  int? id;
  Title? title;
  String? mediaUrl;
  String? mediaType;
  String? externalLink;
  String? publishDate;
  String? expiryDate;
  bool? viewed;
  bool? active;

  NewsResponse({
    this.id,
    this.title,
    this.mediaUrl,
    this.mediaType,
    this.externalLink,
    this.publishDate,
    this.expiryDate,
    this.viewed,
    this.active
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    mediaUrl = json['mediaUrl'];
    mediaType = json['mediaType'];
    externalLink = json['externalLink'];
    publishDate = json['publishDate'];
    expiryDate = json['expiryDate'];
    viewed = json['viewed'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = title!.toJson();
    }
    data['mediaUrl'] = mediaUrl;
    data['mediaType'] = mediaType;
    data['externalLink'] = externalLink;
    data['publishDate'] = publishDate;
    data['expiryDate'] = expiryDate;
    data['viewed'] = viewed;
    data['active'] = active;
    return data;
  }
}

class Title {
  String? uz;
  String? uzCyrl;
  String? kaa;
  String? ru;
  String? en;

  Title({this.uz, this.uzCyrl, this.kaa, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    uzCyrl = json['uzCyrl'];
    kaa = json['kaa'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['uzCyrl'] = uzCyrl;
    data['kaa'] = kaa;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}
