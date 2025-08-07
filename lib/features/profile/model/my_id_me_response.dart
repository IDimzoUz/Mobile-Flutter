class MyIDMeResponse {
  Profile? profile;

  MyIDMeResponse({this.profile});

  MyIDMeResponse.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  CommonData? commonData;
  DocData? docData;
  Contacts? contacts;
  Address? address;

  Profile({this.commonData, this.docData, this.contacts, this.address});

  Profile.fromJson(Map<String, dynamic> json) {
    commonData = json['common_data'] != null
        ? CommonData.fromJson(json['common_data'])
        : null;
    docData = json['doc_data'] != null
        ? DocData.fromJson(json['doc_data'])
        : null;
    contacts = json['contacts'] != null
        ? Contacts.fromJson(json['contacts'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commonData != null) {
      data['common_data'] = commonData!.toJson();
    }
    if (docData != null) {
      data['doc_data'] = docData!.toJson();
    }
    if (contacts != null) {
      data['contacts'] = contacts!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class CommonData {
  String? firstName;
  String? middleName;
  String? lastName;
  String? firstNameEn;
  String? lastNameEn;
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
  String? sdkHash;
  String? lastUpdatePassData;
  String? lastUpdateAddress;

  CommonData(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.firstNameEn,
        this.lastNameEn,
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
        this.sdkHash,
        this.lastUpdatePassData,
        this.lastUpdateAddress});

  CommonData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    firstNameEn = json['first_name_en'];
    lastNameEn = json['last_name_en'];
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
    sdkHash = json['sdk_hash'];
    lastUpdatePassData = json['last_update_pass_data'];
    lastUpdateAddress = json['last_update_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['first_name_en'] = firstNameEn;
    data['last_name_en'] = lastNameEn;
    data['pinfl'] = pinfl;
    data['gender'] = gender;
    data['birth_place'] = birthPlace;
    data['birth_country'] = birthCountry;
    data['birth_country_id'] = birthCountryId;
    data['birth_country_id_cbu'] = birthCountryIdCbu;
    data['birth_date'] = birthDate;
    data['nationality'] = nationality;
    data['nationality_id'] = nationalityId;
    data['nationality_id_cbu'] = nationalityIdCbu;
    data['citizenship'] = citizenship;
    data['citizenship_id'] = citizenshipId;
    data['citizenship_id_cbu'] = citizenshipIdCbu;
    data['sdk_hash'] = sdkHash;
    data['last_update_pass_data'] = lastUpdatePassData;
    data['last_update_address'] = lastUpdateAddress;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pass_data'] = passData;
    data['issued_by'] = issuedBy;
    data['issued_by_id'] = issuedById;
    data['issued_date'] = issuedDate;
    data['expiry_date'] = expiryDate;
    data['doc_type'] = docType;
    data['doc_type_id'] = docTypeId;
    data['doc_type_id_cbu'] = docTypeIdCbu;
    return data;
  }
}

class Contacts {
  String? phone;
  String? email;

  Contacts({this.phone, this.email});

  Contacts.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class Address {
  String? permanentAddress;
  String? temporaryAddress;
  PermanentRegistration? permanentRegistration;
  TemporaryRegistration? temporaryRegistration;

  Address(
      {this.permanentAddress,
        this.temporaryAddress,
        this.permanentRegistration,
        this.temporaryRegistration});

  Address.fromJson(Map<String, dynamic> json) {
    permanentAddress = json['permanent_address'];
    temporaryAddress = json['temporary_address'];
    permanentRegistration = json['permanent_registration'] != null
        ? new PermanentRegistration.fromJson(json['permanent_registration'])
        : null;
    temporaryRegistration = json['temporary_registration'] != null
        ? new TemporaryRegistration.fromJson(json['temporary_registration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permanent_address'] = permanentAddress;
    data['temporary_address'] = temporaryAddress;
    if (permanentRegistration != null) {
      data['permanent_registration'] = permanentRegistration!.toJson();
    }
    if (temporaryRegistration != null) {
      data['temporary_registration'] = temporaryRegistration!.toJson();
    }
    return data;
  }
}

class PermanentRegistration {
  String? region;
  String? address;
  String? country;
  String? cadastre;
  String? district;
  String? regionId;
  String? countryId;
  String? districtId;
  String? regionIdCbu;
  String? countryIdCbu;
  String? districtIdCbu;
  String? registrationDate;

  PermanentRegistration(
      {this.region,
        this.address,
        this.country,
        this.cadastre,
        this.district,
        this.regionId,
        this.countryId,
        this.districtId,
        this.regionIdCbu,
        this.countryIdCbu,
        this.districtIdCbu,
        this.registrationDate});

  PermanentRegistration.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    address = json['address'];
    country = json['country'];
    cadastre = json['cadastre'];
    district = json['district'];
    regionId = json['region_id'];
    countryId = json['country_id'];
    districtId = json['district_id'];
    regionIdCbu = json['region_id_cbu'];
    countryIdCbu = json['country_id_cbu'];
    districtIdCbu = json['district_id_cbu'];
    registrationDate = json['registration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region'] = region;
    data['address'] = address;
    data['country'] = country;
    data['cadastre'] = cadastre;
    data['district'] = district;
    data['region_id'] = regionId;
    data['country_id'] = countryId;
    data['district_id'] = districtId;
    data['region_id_cbu'] = regionIdCbu;
    data['country_id_cbu'] = countryIdCbu;
    data['district_id_cbu'] = districtIdCbu;
    data['registration_date'] = registrationDate;
    return data;
  }
}

class TemporaryRegistration {
  String? region;
  String? address;
  String? country;
  String? cadastre;
  String? district;
  String? dateFrom;
  String? dateTill;
  String? regionId;
  String? countryId;
  String? districtId;
  String? regionIdCbu;
  String? countryIdCbu;
  String? districtIdCbu;

  TemporaryRegistration(
      {this.region,
        this.address,
        this.country,
        this.cadastre,
        this.district,
        this.dateFrom,
        this.dateTill,
        this.regionId,
        this.countryId,
        this.districtId,
        this.regionIdCbu,
        this.countryIdCbu,
        this.districtIdCbu});

  TemporaryRegistration.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    address = json['address'];
    country = json['country'];
    cadastre = json['cadastre'];
    district = json['district'];
    dateFrom = json['date_from'];
    dateTill = json['date_till'];
    regionId = json['region_id'];
    countryId = json['country_id'];
    districtId = json['district_id'];
    regionIdCbu = json['region_id_cbu'];
    countryIdCbu = json['country_id_cbu'];
    districtIdCbu = json['district_id_cbu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region'] = region;
    data['address'] = address;
    data['country'] = country;
    data['cadastre'] = cadastre;
    data['district'] = district;
    data['date_from'] = dateFrom;
    data['date_till'] = dateTill;
    data['region_id'] = regionId;
    data['country_id'] = countryId;
    data['district_id'] = districtId;
    data['region_id_cbu'] = regionIdCbu;
    data['country_id_cbu'] = countryIdCbu;
    data['district_id_cbu'] = districtIdCbu;
    return data;
  }
}
