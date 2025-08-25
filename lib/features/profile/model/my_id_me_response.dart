class MyIDMeResponse {
  Profile? profile;

  MyIDMeResponse({this.profile});

  MyIDMeResponse.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  CommonData? commonData;
  DocData? docData;
  String? authenticationMethod;

  Profile({this.commonData, this.docData, this.authenticationMethod});

  Profile.fromJson(Map<String, dynamic> json) {
    commonData = json['common_data'] != null
        ? new CommonData.fromJson(json['common_data'])
        : null;
    docData = json['doc_data'] != null
        ? new DocData.fromJson(json['doc_data'])
        : null;
    authenticationMethod = json['authentication_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commonData != null) {
      data['common_data'] = this.commonData!.toJson();
    }
    if (this.docData != null) {
      data['doc_data'] = this.docData!.toJson();
    }
    data['authentication_method'] = this.authenticationMethod;
    return data;
  }
}

class CommonData {
  String? firstName;
  String? middleName;
  String? lastName;
  String? pinfl;
  String? gender;
  String? birthPlace;
  String? birthCountry;
  String? birthCountryId;
  String? birthCountryIdCbu;
  String? birthDate;
  String? nationality;
  String? nationalityId;
  String? nationalityIdCbu;
  String? citizenship;
  String? citizenshipId;
  String? citizenshipIdCbu;
  String? docType;
  String? docTypeId;
  String? docTypeIdCbu;
  String? sdkHash;
  String? lastUpdatePassData;
  String? lastUpdateAddress;

  CommonData(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.pinfl,
        this.gender,
        this.birthPlace,
        this.birthCountry,
        this.birthCountryId,
        this.birthCountryIdCbu,
        this.birthDate,
        this.nationality,
        this.nationalityId,
        this.nationalityIdCbu,
        this.citizenship,
        this.citizenshipId,
        this.citizenshipIdCbu,
        this.docType,
        this.docTypeId,
        this.docTypeIdCbu,
        this.sdkHash,
        this.lastUpdatePassData,
        this.lastUpdateAddress});

  CommonData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    pinfl = json['pinfl'];
    gender = json['gender'];
    birthPlace = json['birth_place'];
    birthCountry = json['birth_country'];
    birthCountryId = json['birth_country_id'];
    birthCountryIdCbu = json['birth_country_id_cbu'];
    birthDate = json['birth_date'];
    nationality = json['nationality'];
    nationalityId = json['nationality_id'];
    nationalityIdCbu = json['nationality_id_cbu'];
    citizenship = json['citizenship'];
    citizenshipId = json['citizenship_id'];
    citizenshipIdCbu = json['citizenship_id_cbu'];
    docType = json['doc_type'];
    docTypeId = json['doc_type_id'];
    docTypeIdCbu = json['doc_type_id_cbu'];
    sdkHash = json['sdk_hash'];
    lastUpdatePassData = json['last_update_pass_data'];
    lastUpdateAddress = json['last_update_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['pinfl'] = this.pinfl;
    data['gender'] = this.gender;
    data['birth_place'] = this.birthPlace;
    data['birth_country'] = this.birthCountry;
    data['birth_country_id'] = this.birthCountryId;
    data['birth_country_id_cbu'] = this.birthCountryIdCbu;
    data['birth_date'] = this.birthDate;
    data['nationality'] = this.nationality;
    data['nationality_id'] = this.nationalityId;
    data['nationality_id_cbu'] = this.nationalityIdCbu;
    data['citizenship'] = this.citizenship;
    data['citizenship_id'] = this.citizenshipId;
    data['citizenship_id_cbu'] = this.citizenshipIdCbu;
    data['doc_type'] = this.docType;
    data['doc_type_id'] = this.docTypeId;
    data['doc_type_id_cbu'] = this.docTypeIdCbu;
    data['sdk_hash'] = this.sdkHash;
    data['last_update_pass_data'] = this.lastUpdatePassData;
    data['last_update_address'] = this.lastUpdateAddress;
    return data;
  }
}

class DocData {
  String? passData;
  String? issuedBy;
  String? issuedById;
  String? issuedDate;
  String? expiryDate;
  String? docType;
  String? docTypeId;
  String? docTypeIdCbu;

  DocData(
      {this.passData,
        this.issuedBy,
        this.issuedById,
        this.issuedDate,
        this.expiryDate,
        this.docType,
        this.docTypeId,
        this.docTypeIdCbu});

  DocData.fromJson(Map<String, dynamic> json) {
    passData = json['pass_data'];
    issuedBy = json['issued_by'];
    issuedById = json['issued_by_id'];
    issuedDate = json['issued_date'];
    expiryDate = json['expiry_date'];
    docType = json['doc_type'];
    docTypeId = json['doc_type_id'];
    docTypeIdCbu = json['doc_type_id_cbu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pass_data'] = this.passData;
    data['issued_by'] = this.issuedBy;
    data['issued_by_id'] = this.issuedById;
    data['issued_date'] = this.issuedDate;
    data['expiry_date'] = this.expiryDate;
    data['doc_type'] = this.docType;
    data['doc_type_id'] = this.docTypeId;
    data['doc_type_id_cbu'] = this.docTypeIdCbu;
    return data;
  }
}
