import 'package:alert_app/api/api_item.dart';
import 'package:alert_app/model/get_items.dart';
import 'package:alert_app/view/items_list_view.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  late Future<GetItems> getItemsExpireSoonFirst;
  late Future<GetItems> getItemsExpireSoonSecond;

  late Future<GetItems> getItemsExpiredFirst;
  late Future<GetItems> getItemsExpiredSecond;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    getItemsExpireSoonFirst = ApiItem().getItemsExpireSoon();
    getItemsExpireSoonSecond = ApiItem().getItemsExpireSoon(index: 4);

    getItemsExpiredFirst = ApiItem().getItemsExpired();
    getItemsExpiredSecond = ApiItem().getItemsExpired(index: 4);

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController?.forward();

    return Scaffold(
      backgroundColor: AppTheme.transparent,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 18, right: 16),
                        child: Text(
                          'Produits bientôt expirés',
                          textAlign: TextAlign.left,
                          style: AppTheme.headline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    getCategoryUI(getItemsExpireSoonFirst, 0),
                    getCategoryUI(getItemsExpireSoonSecond, 4),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
                        child: Text(
                          'Produits expirés',
                          textAlign: TextAlign.left,
                          style: AppTheme.headline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    getCategoryUI(getItemsExpiredFirst, 0),
                    getCategoryUI(getItemsExpiredSecond, 4),
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCategoryUI(Future<GetItems> getItems, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ItemsListView(
          callIndex: index,
          getItems: getItems,
        ),
      ],
    );
  }
}
