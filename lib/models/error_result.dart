class ErrorResult {
  bool errors;
  String accntNotFound;
  Null auth;
  Null data;
  String errorMessage;

  ErrorResult(
      {this.errors,
      this.accntNotFound,
      this.auth,
      this.data,
      this.errorMessage});

  ErrorResult.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'];
    accntNotFound = json['AccntNotFound'];
    auth = json['Auth'];
    data = json['Data'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    data['AccntNotFound'] = this.accntNotFound;
    data['Auth'] = this.auth;
    data['Data'] = this.data;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}