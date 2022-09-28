import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

const storage = FlutterSecureStorage();

class ApiStore {
  Future<GetUser> getUser(BuildContext context) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken});

    debugPrint('getUser ${response.statusCode}');

    if (response.statusCode == 200) {
      GetUser model = userFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }
}
