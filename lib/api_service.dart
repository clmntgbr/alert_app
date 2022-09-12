import 'dart:async';

import 'package:alert_app/constants.dart';
import 'package:alert_app/models/get_active_store.dart';
import 'package:alert_app/models/get_items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiService {
  static const String token =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NjI5OTkzMDYsImV4cCI6MTY2OTA0NzMwNiwicm9sZXMiOlsiUk9MRV9BRE1JTiIsIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImNsZW1lbnRAZ21haWwuY29tIn0.Q1aJ_zr8f1NSzB4cIel594OYfNeOP0rWSMhRqUXlmA7PvIyL0beGNUy0J1zAtxplq_B9r2bBIRu4dQateEQ6tbe6-p3keBQAPpPemdEDewo_K_Gg3BiBy2_T0i8-s4x8Qfa7wTm0mZcAZGJUnbg_tWdl6s4yPBn2kQj047g3wa_7jY2li1itrihYEns45taVhzQ3oP-0mgBcjijBeiofZ3eR8-HV1KphhmawM_tKgHDpmclhkbUnxs43kxGY8xM_Jc_9rg-6lCVje5Xw-KKJaic_KxLgNJfjCOGgyUfxf9mEUMCLoWw_IBKo_KS3y3LjDPkpQ7J30__0O_VO3b2p5g';

  Future<GetActiveStore> getActiveStore() async {
    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.activeStoreEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.activeStoreEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': token});

    if (response.statusCode == 200) {
      GetActiveStore model = activeStoreFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItemsExpireSoonLimited() async {
    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonLimitedEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpireSoonLimitedEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': token});

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }

  Future<GetItems> getItemsExpiredLimited() async {
    debugPrint('GET ${ApiConstants.baseUrl}${ApiConstants.itemsExpiredLimitedEndpoint}');

    Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.itemsExpiredLimitedEndpoint}'),
        headers: {'Content-Type': 'application/ld+json', 'Accept': 'application/ld+json', 'Authorization': token});

    if (response.statusCode == 200) {
      GetItems model = itemsFromJson(
        response.body.toString(),
      );
      return model;
    }

    throw Exception('Failed to load Items');
  }
}
