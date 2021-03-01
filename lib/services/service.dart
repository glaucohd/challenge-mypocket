import 'dart:convert';
import 'dart:io';
import 'package:pocket_app/constants/service_constant.dart';
import 'package:pocket_app/models/account_user.dart';
import 'package:pocket_app/models/error_result.dart';
import 'package:pocket_app/models/error_update.dart';
import 'package:pocket_app/models/result_update.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  AccountUser user;
  ResultUpdate resultUpdate;
  String alertResult;
  String errorAlert;
  ErrorResult errorResult;
  ErrorUpdate errorUpdate;
  String errorUpdateAlert;

  //--------- AUTENTICAÇÃO DO USUARIO ------//
  Future<bool> signIn(
    String docNumber,
    String accntType,
    String activatationKey,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    HttpClient client = new HttpClient();

    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    Map map = {
      "DocNumber": docNumber,
      "AccntType": accntType,
      "ActivatationKey": activatationKey
    };

    HttpClientRequest request =
        await client.postUrl(Uri.parse(ServiceConstant.API_GET));

    request.headers.set(
      ServiceConstant.content,
      ServiceConstant.typeJson,
    );

    request.add(utf8.encode(json.encode(map)));

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      String body = await response.transform(utf8.decoder).join();

      Map accountMap = jsonDecode(body);

      if (accountMap.isNotEmpty) {
        user = AccountUser.fromJson(accountMap);

        try {
          if (user.errors == false) {
            prefs.setString("accntId", user.data.accntId);
            return true;
          } else {
            errorResult = ErrorResult.fromJson(accountMap);
            return false;
          }
        } catch (e) {
          print(e.toString());
        }

        return false;
      }
    } else {
      throw Exception('Failed to load post');
    }

    return false;
  }

  //--------- ATUALIZA DADOS DO USUARIO ---------//
  Future<bool> updateAccount(
    String address,
    String addressComplement,
    String addressNumber,
    String neighborhood,
    String city,
    String state,
    String postalCode,
    String country,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String accntId = prefs.getString('accntId');

    HttpClient client = new HttpClient();

    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    Map<String, dynamic> map = {
      'AccntId': accntId,
      'Address': address,
      'AddressComplement': addressComplement,
      'AddressNumber': addressNumber,
      'Neighborhood': neighborhood,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      "Country": country
    };

    HttpClientRequest request =
        await client.postUrl(Uri.parse(ServiceConstant.API_POST));

    request.headers.set(
      ServiceConstant.content,
      ServiceConstant.typeJson,
    );

    request.add(utf8.encode(json.encode(map)));

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      String body = await response.transform(utf8.decoder).join();

      Map updateAccountMap = jsonDecode(body);

      if (updateAccountMap.isNotEmpty) {
        resultUpdate = ResultUpdate.fromJson(updateAccountMap);

        try {
          if (resultUpdate.errors == false) {
            alertResult = resultUpdate.data;

            return true;
          } else {
            errorUpdate = ErrorUpdate.fromJson(updateAccountMap);

            errorUpdateAlert = errorUpdate.errorMessage.state[0];

            return false;
          }
        } catch (e) {
          print(e.toString());
        }
      }
    } else {
      
      throw Exception('Failed to load post');
    }

    return false;
  }
}
