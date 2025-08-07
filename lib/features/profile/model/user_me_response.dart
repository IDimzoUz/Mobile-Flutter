class UserMeResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? role;

  UserMeResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profilePhotoUrl,
    this.role
  });

  UserMeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profilePhotoUrl = json['profilePhotoUrl'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['profilePhotoUrl'] = profilePhotoUrl;
    data['role'] = role;
    return data;
  }
}
