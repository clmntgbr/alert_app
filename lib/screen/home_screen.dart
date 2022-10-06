import 'package:alert_app/api/api_item.dart';
import 'package:alert_app/model/get_items.dart';
import 'package:alert_app/screen/items_screen.dart';
import 'package:alert_app/view/items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  late Future<GetItems> getItemsLikedFirst;
  late Future<GetItems> getItemsLikedSecond;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    getItemsExpireSoonFirst = ApiItem().getItemsExpireSoon();
    getItemsExpireSoonSecond = ApiItem().getItemsExpireSoon(index: 4);

    getItemsExpiredFirst = ApiItem().getItemsExpired();
    getItemsExpiredSecond = ApiItem().getItemsExpired(index: 4);

    getItemsLikedFirst = ApiItem().getItemsLiked();
    getItemsLikedSecond = ApiItem().getItemsLiked(index: 4);

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
                        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Produits bientôt expirés',
                              textAlign: TextAlign.left,
                              style: AppTheme.headline,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.white,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => const ItemsScreen(type: 'get_items_expire_soon'),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Tout voir',
                                    style: GoogleFonts.lilitaOne(
                                      color: AppTheme.secondaryColor,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppTheme.secondaryColor,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    getInlineItems(getItemsExpireSoonFirst),
                    getInlineItems(getItemsExpireSoonSecond),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Produits expirés',
                              textAlign: TextAlign.left,
                              style: AppTheme.headline,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.white,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => const ItemsScreen(type: 'get_items_expired'),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Tout voir',
                                    style: GoogleFonts.lilitaOne(
                                      color: AppTheme.secondaryColor,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppTheme.secondaryColor,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    getInlineItems(getItemsExpiredFirst),
                    getInlineItems(getItemsExpiredSecond),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Produits favoris',
                              textAlign: TextAlign.left,
                              style: AppTheme.headline,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.white,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => const ItemsScreen(type: 'get_items_liked'),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Tout voir',
                                    style: GoogleFonts.lilitaOne(
                                      color: AppTheme.secondaryColor,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppTheme.secondaryColor,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    getInlineItems(getItemsLikedFirst),
                    getInlineItems(getItemsLikedSecond),
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

  Widget getInlineItems(Future<GetItems> getItems) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ItemsListView(
          getItems: getItems,
        ),
      ],
    );
  }
}
