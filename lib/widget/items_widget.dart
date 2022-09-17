import 'package:alert_app/app_theme.dart';
import 'package:alert_app/models/get_items.dart';
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

Container isLiked(Item? item) {
  Container container = Container();
  if (item != null && item.isLiked) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.nearlyBlue,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: MaterialButton(
        elevation: 1,
        padding: const EdgeInsets.all(0),
        hoverColor: Colors.black,
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.favorite_border_sharp,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  if (item != null && !item.isLiked) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          Icons.favorite_border_sharp,
          color: AppTheme.nearlyBlue,
        ),
      ),
    );
  }
  return container;
}

List<Widget> expirationDateAndIsLiked(Item? item) {
  List<Widget> row = [];

  if (item != null && item.expirationDate != null) {
    row.add(const Icon(
      Icons.notifications_none,
      size: 14.0,
    ));
    row.add(Text(
      ' ${item!.expirationDate}',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[500],
        fontWeight: FontWeight.w400,
      ),
    ));
  }

  row.add(const Spacer());

  row.add(
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: isLiked(item),
    ),
  );

  return row;
}
