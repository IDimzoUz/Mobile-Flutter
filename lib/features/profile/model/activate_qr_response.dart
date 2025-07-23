class ActivateQrResponse {
  String? event;
  String? date;
  String? startTime;
  String? endTime;
  String? ticketStatus;

  ActivateQrResponse(
      {this.event, this.date, this.startTime, this.endTime, this.ticketStatus});

  ActivateQrResponse.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    ticketStatus = json['ticket_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event'] = this.event;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['ticket_status'] = this.ticketStatus;
    return data;
  }
}
