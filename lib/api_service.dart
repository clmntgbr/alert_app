import 'dart:async';
import 'dart:convert';

import 'package:alert_app/constants.dart';
import 'package:alert_app/models/get_active_store.dart';
import 'package:alert_app/models/get_item.dart' as get_item;
import 'package:alert_app/models/get_items.dart';
import 'package:alert_app/models/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

const String token =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NjIxNDM4NTYsImV4cCI6MTY2ODE5MTg1Niwicm9sZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImNsZW1lbnRAZ21haWwuY29tIn0.jpNZPek_BrbTFJvIzi1xFJgtPA9Ntu9F6VzUK24BPEQOrrdHVI_cqg-yiI_2F51abB06TZ9uMllixKnvGEdRBNkezsRwDfJRuVri1w_T9LzqZg2TxGGxhbUon5pUO3rseIdYTew3iKzll52YiLuq_VsiCi2xsVvA9S1AunQD1vSuO7Nd6PdnufU5uJwbAAFv5qwEX3OAT8EsXVvFESJOILXzXhIWSQ5KsYe_dWneNWyZdDt4ZCFATrRV8JrDE7na0mn5RzfER7Lj03DOaPTWDDbCc4N1qT4kdcaDhmFRB5hIAkpLUMDbJDNFdSqP80tzf8yKjc2xCd6qJ4PKPSXsdQ';

const storage = FlutterSecureStorage();

class ApiService {
  Future<GetActiveStore> getActiveStore() async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.activeStoreEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.activeStoreEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi});

    if (response.statusCode == 200) {
      GetActiveStore model = activeStoreFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItemsExpireSoonLimited(BuildContext context) async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonLimitedEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonLimitedEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi});

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetUser> getUser(BuildContext context) async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi});

    if (response.statusCode == 200) {
      GetUser model = userFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  void putItemsLiked(int itemId, bool value) async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    Map body = {'isLiked': value};

    debugPrint('PUT ${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId');
    debugPrint(json.encode(body));

    put(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi}, body: json.encode(body));
  }

  Future<GetItems> getItemsExpiredLimited() async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpiredLimitedEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpiredLimitedEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi});

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<get_item.GetItem> getItem(int itemId, context) async {
    await storage.write(key: 'tokenApi', value: token);

    final tokenApi = await storage.read(key: 'tokenApi');

    if (tokenApi == null) {
      throw Exception('Failed to load Items'); //SEND TO LOGIN PAGE
    }

    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsEndpoint}/$itemId'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': tokenApi});

    if (response.statusCode == 200) {
      get_item.GetItem model = get_item.itemFromJson(response.body.toString());
      debugPrint(model.toString());
      return model;
    }

    throw Exception('Failed to load Item');
  }
}
