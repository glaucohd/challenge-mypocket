import 'package:pocket_app/models/auth.dart';
import 'package:pocket_app/models/data.dart';

class AccountUser {
  bool errors;
  String accntNotFound;
  Data data;
  Auth auth;

  AccountUser({this.errors, this.accntNotFound, this.data, this.auth});

  AccountUser.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'];
    accntNotFound = json['AccntNotFound'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    auth = json['Auth'] != null ? new Auth.fromJson(json['Auth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    data['AccntNotFound'] = this.accntNotFound;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    if (this.auth != null) {
      data['Auth'] = this.auth.toJson();
    }
    return data;
  }
}



