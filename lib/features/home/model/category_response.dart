class CategoryResponse {
  final int id;
  final String nameUz;
  final String nameUzCyrl;
  final String nameKaa;
  final String nameRu;
  final String nameEn;
  final int? parentId;
  final List<CategoryResponse>? children;

  CategoryResponse({
    required this.id,
    required this.nameUz,
    required this.nameUzCyrl,
    required this.nameKaa,
    required this.nameRu,
    required this.nameEn,
    this.parentId,
    this.children,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json['id'],
      nameUz: json['nameUz'],
      nameUzCyrl: json['nameUzCyrl'],
      nameKaa: json['nameKaa'],
      nameRu: json['nameRu'],
      nameEn: json['nameEn'],
      parentId: json['parentId'],
      children: json['children'] != null
          ? List<CategoryResponse>.from(
          json['children'].map((x) => CategoryResponse.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameUz': nameUz,
      'nameUzCyrl': nameUzCyrl,
      'nameKaa': nameKaa,
      'nameRu': nameRu,
      'nameEn': nameEn,
      'parentId': parentId,
      'children': children?.map((x) => x.toJson()).toList(),
    };
  }
}