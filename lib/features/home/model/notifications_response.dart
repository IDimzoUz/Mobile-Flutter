class AllNotificationsResponse {
  int? totalElements;
  int? totalPages;
  Pageable? pageable;
  int? size;
  List<Content>? content;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? last;
  bool? empty;

  AllNotificationsResponse({
    this.totalElements,
    this.totalPages,
    this.pageable,
    this.size,
    this.content,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.last,
    this.empty
  });

  AllNotificationsResponse.fromJson(Map<String, dynamic> json) {
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    size = json['size'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['size'] = this.size;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['last'] = this.last;
    data['empty'] = this.empty;
    return data;
  }
}

class Pageable {
  bool? paged;
  int? pageNumber;
  int? pageSize;
  int? offset;
  Sort? sort;
  bool? unpaged;

  Pageable({
    this.paged,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.sort,
    this.unpaged
  });

  Pageable.fromJson(Map<String, dynamic> json) {
    paged = json['paged'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paged'] = paged;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['offset'] = offset;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}

class Content {
  int? id;
  String? title;
  String? body;
  String? type;
  bool? isRead;
  int? contractId;
  int? senderId;
  String? senderName;
  String? createdAt;
  String? readAt;

  Content({
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.contractId,
    this.senderId,
    this.senderName,
    this.createdAt,
    this.readAt
  });

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    type = json['type'];
    isRead = json['isRead'];
    contractId = json['contractId'];
    senderId = json['senderId'];
    senderName = json['senderName'];
    createdAt = json['createdAt'];
    readAt = json['readAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['type'] = type;
    data['isRead'] = isRead;
    data['contractId'] = contractId;
    data['senderId'] = senderId;
    data['senderName'] = senderName;
    data['createdAt'] = createdAt;
    data['readAt'] = readAt;
    return data;
  }
}
