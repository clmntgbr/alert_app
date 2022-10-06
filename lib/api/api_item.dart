import 'dart:convert';

import 'package:alert_app/constants.dart';
import 'package:alert_app/globals.dart' as globals;
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

    String storeActiveId = '&store.isActive=true';
    if (globals.storeActiveId != 0) {
      storeActiveId = '&store.id=${globals.storeActiveId}';
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonEndpoint}?index=$index&limit=$limit$storeActiveId';

    Response response = await get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );

    debugPrint('GET $url -> ${response.statusCode}');

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

    String storeActiveId = '&store.isActive=true';
    if (globals.storeActiveId != 0) {
      storeActiveId = '&store.id=${globals.storeActiveId}';
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsExpiredEndpoint}?index=$index&limit=$limit$storeActiveId';

    Response response = await get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );

    debugPrint('GET $url -> ${response.statusCode}');

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItems() async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    String storeActiveId = 'store.isActive=true';
    if (globals.storeActiveId != 0) {
      storeActiveId = 'store.id=${globals.storeActiveId}';
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}?$storeActiveId';

    Response response = await get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );

    debugPrint('GET $url -> ${response.statusCode}');

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItemsLiked({int? index = 0, int? limit = 4}) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    String storeActiveId = '&store.isActive=true';
    if (globals.storeActiveId != 0) {
      storeActiveId = '&store.id=${globals.storeActiveId}';
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsLikedEndpoint}?index=$index&limit=$limit$storeActiveId';

    Response response = await get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );

    debugPrint('GET $url -> ${response.statusCode}');

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  void putItemLiked(int itemId, bool value) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    Map body = {'isLiked': value};

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId';

    debugPrint('PUT $url');
    debugPrint(json.encode(body));

    put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
      body: json.encode(body),
    );
  }

  Future<GetItem> getItem(int itemId, context) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId';

    debugPrint('GET $url');

    Response response = await get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );

    if (response.statusCode == 200) {
      GetItem model = itemFromJson(response.body.toString());
      return model;
    }

    throw Exception('Failed to load Item');
  }

  void deleteItem(int itemId) async {
    await storage.write(key: 'apiToken', value: ApiConstants.apiToken);

    final apiToken = await storage.read(key: 'apiToken');

    if (apiToken == null) {
      throw Exception('Failed to load Items');
    }

    String url = '${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId';

    debugPrint('DELETE $url');

    delete(
      Uri.parse(url),
      headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': apiToken},
    );
  }
}
