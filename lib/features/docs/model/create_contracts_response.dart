class CreateContractsResponse {
  int? templateId;
  int? contractId;
  String? languageCode;
  String? filledContent;
  String? templateName;
  String? recipientDocumentId;
  String? recipientBirthDate;

  CreateContractsResponse({
    this.templateId,
    this.contractId,
    this.languageCode,
    this.filledContent,
    this.templateName,
    this.recipientDocumentId,
    this.recipientBirthDate
  });

  CreateContractsResponse.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'];
    contractId = json['contractId'];
    languageCode = json['languageCode'];
    filledContent = json['filledContent'];
    templateName = json['templateName'];
    recipientDocumentId = json['recipientDocumentId'];
    recipientBirthDate = json['recipientBirthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['templateId'] = templateId;
    data['contractId'] = contractId;
    data['languageCode'] = languageCode;
    data['filledContent'] = filledContent;
    data['templateName'] = templateName;
    data['recipientDocumentId'] = recipientDocumentId;
    data['recipientBirthDate'] = recipientBirthDate;
    return data;
  }
}
