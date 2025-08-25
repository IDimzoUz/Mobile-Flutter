class EditMeResponse {
  String? firstName;
  String? lastName;
  String? email;
  String? profilePhotoUrl;
  String? birthDate;
  String? gender;
  String? address;
  String? passportSerial;
  String? pinfl;

  EditMeResponse({
    this.firstName,
    this.lastName,
    this.email,
    this.profilePhotoUrl,
    this.birthDate,
    this.gender,
    this.address,
    this.passportSerial,
    this.pinfl
  });

  EditMeResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profilePhotoUrl = json['profilePhotoUrl'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    address = json['address'];
    passportSerial = json['passportSerial'];
    pinfl = json['pinfl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profilePhotoUrl'] = profilePhotoUrl;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['address'] = address;
    data['passportSerial'] = passportSerial;
    data['pinfl'] = pinfl;
    return data;
  }
}
