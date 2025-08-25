class PaymentResponse {
  bool? isPaid;
  int? orderId;
  int? contractId;
  String? paymentUrl;

  PaymentResponse({this.isPaid, this.orderId, this.contractId, this.paymentUrl});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    isPaid = json['isPaid'];
    orderId = json['orderId'];
    contractId = json['contractId'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isPaid'] = this.isPaid;
    data['orderId'] = this.orderId;
    data['contractId'] = this.contractId;
    data['paymentUrl'] = this.paymentUrl;
    return data;
  }
}
