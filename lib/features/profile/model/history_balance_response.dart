class HistoryBalanceResponse {
  int? productId;
  String? productName;
  double? totalAmount;
  int? transactionCount;

  HistoryBalanceResponse(
      {this.productId,
        this.productName,
        this.totalAmount,
        this.transactionCount});

  HistoryBalanceResponse.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    totalAmount = json['totalAmount'];
    transactionCount = json['transactionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['totalAmount'] = this.totalAmount;
    data['transactionCount'] = this.transactionCount;
    return data;
  }
}
