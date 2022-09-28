import 'dart:convert';

import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_item.dart';
import 'package:alert_app/model/get_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

const storage = FlutterSecureStorage();

class ApiItem {
  Future<GetItems> getItemsExpireSoon({int? index = 0, int? limit = 4}) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonEndpoint}?index=$index&limit=$limit');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonEndpoint}?index=$index&limit=$limit'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken});

    debugPrint('getItemsExpireSoon ${response.statusCode}');

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItemsExpired({int? index = 0, int? limit = 4}) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpiredEndpoint}?index=$index&limit=$limit');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpiredEndpoint}?index=$index&limit=$limit'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken});

    debugPrint('getItemsExpired ${response.statusCode}');

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  void putItemsLiked(int itemId, bool value) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    Map body = {'isLiked': value};

    debugPrint('PUT ${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId');
    debugPrint(json.encode(body));

    put(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken}, body: json.encode(body));
  }

  Future<GetItem> getItem(int itemId, context) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken});

    if (response.statusCode == 200) {
      GetItem model = itemFromJson(response.body.toString());
      debugPrint(model.toString());
      return model;
    }

    throw Exception('Failed to load Item');
  }
}
