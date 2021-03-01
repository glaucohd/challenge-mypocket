class ResultUpdate {
  bool errors;
  String data;

  ResultUpdate({this.errors, this.data});

  ResultUpdate.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    data['Data'] = this.data;
    return data;
  }
}