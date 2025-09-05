class ForMeHistoryResponse {
  int? contractId;
  String? templateName;
  String? content;
  String? createdAt;
  String? recipientDocumentId;
  String? recipientBirthDate;
  String? status;
  String? statusDescription;
  bool? forMe;

  ForMeHistoryResponse({
    this.contractId,
    this.templateName,
    this.content,
    this.createdAt,
    this.recipientDocumentId,
    this.recipientBirthDate,
    this.status,
    this.statusDescription,
    this.forMe = true,
  });

  ForMeHistoryResponse.fromJson(Map<String, dynamic> json) {
    contractId = json['contractId'];
    templateName = json['templateName'];
    content = json['content'];
    createdAt = json['createdAt'];
    recipientDocumentId = json['recipientDocumentId'];
    recipientBirthDate = json['recipientBirthDate'];
    status = json['status'];
    statusDescription = json['statusDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contractId'] = this.contractId;
    data['templateName'] = this.templateName;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['recipientDocumentId'] = this.recipientDocumentId;
    data['recipientBirthDate'] = this.recipientBirthDate;
    data['status'] = this.status;
    data['statusDescription'] = this.statusDescription;
    return data;
  }
}
