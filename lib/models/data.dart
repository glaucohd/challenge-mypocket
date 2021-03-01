class Data {
  String isValid;
  String isActive;
  String accntName;
  String accntContactName;
  String accntEmail;
  String accntCellPhNum;
  String accntMainPhNum;
  String accntProfileId;
  String accntId;
  Null accntBusNum;
  String countryDocNumber;
  String countryProfile;
  Null rEFERREDBYACCOUNTID;
  String bankAccountNumber;
  String bankAccountDigit;
  String bankRoutingNumber;
  Null bankCode;
  Null bankName;
  String currency;
  String currencySymbol;
  String docRequired;
  String biRequired;
  String authorization;
  String availableBalance;
  String address;
  String addressComplement;
  String addressNumber;
  String city;
  String state;
  String country;
  String neighborhood;
  String postalCode;
  String birthDate;
  String generalRecord;
  String accntType;
  String language;

  Data(
      {this.isValid,
      this.isActive,
      this.accntName,
      this.accntContactName,
      this.accntEmail,
      this.accntCellPhNum,
      this.accntMainPhNum,
      this.accntProfileId,
      this.accntId,
      this.accntBusNum,
      this.countryDocNumber,
      this.countryProfile,
      this.rEFERREDBYACCOUNTID,
      this.bankAccountNumber,
      this.bankAccountDigit,
      this.bankRoutingNumber,
      this.bankCode,
      this.bankName,
      this.currency,
      this.currencySymbol,
      this.docRequired,
      this.biRequired,
      this.authorization,
      this.availableBalance,
      this.address,
      this.addressComplement,
      this.addressNumber,
      this.city,
      this.state,
      this.country,
      this.neighborhood,
      this.postalCode,
      this.birthDate,
      this.generalRecord,
      this.accntType,
      this.language});

  Data.fromJson(Map<String, dynamic> json) {
    isValid = json['IsValid'];
    isActive = json['IsActive'];
    accntName = json['AccntName'];
    accntContactName = json['AccntContactName'];
    accntEmail = json['AccntEmail'];
    accntCellPhNum = json['AccntCellPhNum'];
    accntMainPhNum = json['AccntMainPhNum'];
    accntProfileId = json['AccntProfileId'];
    accntId = json['AccntId'];
    accntBusNum = json['AccntBusNum'];
    countryDocNumber = json['CountryDocNumber'];
    countryProfile = json['CountryProfile'];
    rEFERREDBYACCOUNTID = json['REFERRED_BY_ACCOUNT_ID'];
    bankAccountNumber = json['BankAccountNumber'];
    bankAccountDigit = json['BankAccountDigit'];
    bankRoutingNumber = json['BankRoutingNumber'];
    bankCode = json['BankCode'];
    bankName = json['BankName'];
    currency = json['Currency'];
    currencySymbol = json['CurrencySymbol'];
    docRequired = json['DocRequired'];
    biRequired = json['BiRequired'];
    authorization = json['Authorization'];
    availableBalance = json['AvailableBalance'];
    address = json['Address'];
    addressComplement = json['AddressComplement'];
    addressNumber = json['AddressNumber'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    neighborhood = json['Neighborhood'];
    postalCode = json['PostalCode'];
    birthDate = json['BirthDate'];
    generalRecord = json['GeneralRecord'];
    accntType = json['AccntType'];
    language = json['Language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsValid'] = this.isValid;
    data['IsActive'] = this.isActive;
    data['AccntName'] = this.accntName;
    data['AccntContactName'] = this.accntContactName;
    data['AccntEmail'] = this.accntEmail;
    data['AccntCellPhNum'] = this.accntCellPhNum;
    data['AccntMainPhNum'] = this.accntMainPhNum;
    data['AccntProfileId'] = this.accntProfileId;
    data['AccntId'] = this.accntId;
    data['AccntBusNum'] = this.accntBusNum;
    data['CountryDocNumber'] = this.countryDocNumber;
    data['CountryProfile'] = this.countryProfile;
    data['REFERRED_BY_ACCOUNT_ID'] = this.rEFERREDBYACCOUNTID;
    data['BankAccountNumber'] = this.bankAccountNumber;
    data['BankAccountDigit'] = this.bankAccountDigit;
    data['BankRoutingNumber'] = this.bankRoutingNumber;
    data['BankCode'] = this.bankCode;
    data['BankName'] = this.bankName;
    data['Currency'] = this.currency;
    data['CurrencySymbol'] = this.currencySymbol;
    data['DocRequired'] = this.docRequired;
    data['BiRequired'] = this.biRequired;
    data['Authorization'] = this.authorization;
    data['AvailableBalance'] = this.availableBalance;
    data['Address'] = this.address;
    data['AddressComplement'] = this.addressComplement;
    data['AddressNumber'] = this.addressNumber;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Neighborhood'] = this.neighborhood;
    data['PostalCode'] = this.postalCode;
    data['BirthDate'] = this.birthDate;
    data['GeneralRecord'] = this.generalRecord;
    data['AccntType'] = this.accntType;
    data['Language'] = this.language;
    return data;
  }
}