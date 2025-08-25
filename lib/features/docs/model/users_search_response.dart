class UsersSearchResponse {
  bool? found;
  String? firstName;
  String? lastName;
  String? message;

  UsersSearchResponse(
      {this.found, this.firstName, this.lastName, this.message});

  UsersSearchResponse.fromJson(Map<String, dynamic> json) {
    found = json['found'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['found'] = found;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['message'] = message;
    return data;
  }
}
