class ErrorUpdate {
  bool errors;
  ErrorMessage errorMessage;

  ErrorUpdate({this.errors, this.errorMessage});

  ErrorUpdate.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'];
    errorMessage = json['ErrorMessage'] != null
        ? new ErrorMessage.fromJson(json['ErrorMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    if (this.errorMessage != null) {
      data['ErrorMessage'] = this.errorMessage.toJson();
    }
    return data;
  }
}

class ErrorMessage {
  List<String> state;

  ErrorMessage({this.state});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    state = json['State'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['State'] = this.state;
    return data;
  }
}