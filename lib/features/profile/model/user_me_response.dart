class UserMeResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? role;
  String? birthDate;
  String? gender;
  String? address;
  String? passportSerial;
  String? pinfl;
  bool? isPremium;
  String? premiumExpiresAt;
  int? premiumDaysRemaining;
  bool? isPremiumExpiringSoon;
  String? createdAt;

  UserMeResponse(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.profilePhotoUrl,
        this.role,
        this.birthDate,
        this.gender,
        this.address,
        this.passportSerial,
        this.pinfl,
        this.isPremium,
        this.premiumExpiresAt,
        this.premiumDaysRemaining,
        this.isPremiumExpiringSoon,
        this.createdAt});

  UserMeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profilePhotoUrl = json['profilePhotoUrl'];
    role = json['role'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    address = json['address'];
    passportSerial = json['passportSerial'];
    pinfl = json['pinfl'];
    isPremium = json['isPremium'];
    premiumExpiresAt = json['premiumExpiresAt'];
    premiumDaysRemaining = json['premiumDaysRemaining'];
    isPremiumExpiringSoon = json['isPremiumExpiringSoon'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePhotoUrl'] = this.profilePhotoUrl;
    data['role'] = this.role;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['passportSerial'] = this.passportSerial;
    data['pinfl'] = this.pinfl;
    data['isPremium'] = this.isPremium;
    data['premiumExpiresAt'] = this.premiumExpiresAt;
    data['premiumDaysRemaining'] = this.premiumDaysRemaining;
    data['isPremiumExpiringSoon'] = this.isPremiumExpiringSoon;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
