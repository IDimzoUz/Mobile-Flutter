class CreateContractsResponse {
  int? templateId;
  int? contractId;
  String? languageCode;
  String? filledContent;
  String? templateName;
  String? recipientDocumentId;
  String? recipientBirthDate;
  String? recipientPhoneNumber;
  String? recipientPhoneNumber2;
  String? recipientPhoneNumber3;
  int? orderId;
  String? paymentStatus;
  String? status;
  bool? creatorApproved;
  bool? recipientApproved;
  String? creatorApprovedAt;
  String? recipientApprovedAt;
  bool? paid;

  CreateContractsResponse(
      {this.templateId,
        this.contractId,
        this.languageCode,
        this.filledContent,
        this.templateName,
        this.recipientDocumentId,
        this.recipientBirthDate,
        this.recipientPhoneNumber,
        this.recipientPhoneNumber2,
        this.recipientPhoneNumber3,
        this.orderId,
        this.paymentStatus,
        this.status,
        this.creatorApproved,
        this.recipientApproved,
        this.creatorApprovedAt,
        this.recipientApprovedAt,
        this.paid});

  CreateContractsResponse.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'];
    contractId = json['contractId'];
    languageCode = json['languageCode'];
    filledContent = json['filledContent'];
    templateName = json['templateName'];
    recipientDocumentId = json['recipientDocumentId'];
    recipientBirthDate = json['recipientBirthDate'];
    recipientPhoneNumber = json['recipientPhoneNumber'];
    recipientPhoneNumber2 = json['recipientPhoneNumber2'];
    recipientPhoneNumber3 = json['recipientPhoneNumber3'];
    orderId = json['orderId'];
    paymentStatus = json['paymentStatus'];
    status = json['status'];
    creatorApproved = json['creatorApproved'];
    recipientApproved = json['recipientApproved'];
    creatorApprovedAt = json['creatorApprovedAt'];
    recipientApprovedAt = json['recipientApprovedAt'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['templateId'] = this.templateId;
    data['contractId'] = this.contractId;
    data['languageCode'] = this.languageCode;
    data['filledContent'] = this.filledContent;
    data['templateName'] = this.templateName;
    data['recipientDocumentId'] = this.recipientDocumentId;
    data['recipientBirthDate'] = this.recipientBirthDate;
    data['recipientPhoneNumber'] = this.recipientPhoneNumber;
    data['recipientPhoneNumber2'] = this.recipientPhoneNumber2;
    data['recipientPhoneNumber3'] = this.recipientPhoneNumber3;
    data['orderId'] = this.orderId;
    data['paymentStatus'] = this.paymentStatus;
    data['status'] = this.status;
    data['creatorApproved'] = this.creatorApproved;
    data['recipientApproved'] = this.recipientApproved;
    data['creatorApprovedAt'] = this.creatorApprovedAt;
    data['recipientApprovedAt'] = this.recipientApprovedAt;
    data['paid'] = this.paid;
    return data;
  }
}
