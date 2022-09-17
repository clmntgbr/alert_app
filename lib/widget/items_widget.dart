import 'package:alert_app/app_theme.dart';
import 'package:alert_app/view/item_view.dart';
import 'package:alert_app/view/list_items_view.dart';
import 'package:flutter/material.dart';

Widget getExpiredItems(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
        child: Text(
          'Produits expirés',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: 0.27,
            color: AppTheme.darkerText,
          ),
        ),
      ),
      ListExpiredItemsView(),
    ],
  );
}

Widget getExpireSoonItems(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 8.0, left: 18, right: 16),
        child: Text(
          'Bientôt expirés',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: 0.27,
            color: AppTheme.darkerText,
          ),
        ),
      ),
      ListExpireSoonItemsView(),
    ],
  );
}

void moveTo(context) {
  Navigator.push<dynamic>(
    context,
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const ItemView(),
    ),
  );
}
