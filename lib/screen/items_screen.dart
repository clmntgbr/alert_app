import 'package:alert_app/api/api_item.dart';
import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_items.dart';
import 'package:alert_app/screen/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  ItemsScreenState createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> with TickerProviderStateMixin {
  AnimationController? animationController;
  late Future<GetItems> getItems;
  int totalItems = -1;

  @override
  void initState() {
    getItems = ApiItem().getItemsLiked(limit: 100);
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Padding getExpirationDate(Item item) {
    if (item.expirationDate != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Icon(
                Icons.alarm_outlined,
                size: 14,
                color: AppTheme.grey.withOpacity(0.8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 2),
              child: Text(
                '${item.expirationDate}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: AppTheme.grey.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: FutureBuilder<GetItems>(
                            future: getItems,
                            builder: (BuildContext context, AsyncSnapshot<GetItems> snapshot) {
                              if (!snapshot.hasData) {
                                return const SizedBox(
                                  height: 0,
                                );
                              }

                              if (totalItems == -1) {
                                totalItems = snapshot.data?.totalItems ?? 0;
                              }

                              if (totalItems == 0) {
                                return const SizedBox(
                                  height: 0,
                                );
                              }

                              return GridView(
                                padding: const EdgeInsets.all(8),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.8,
                                ),
                                children: List<Widget>.generate(
                                  totalItems,
                                  (int index) {
                                    final int count = totalItems;
                                    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                        parent: animationController!,
                                        curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                                      ),
                                    );
                                    animationController?.forward();

                                    Item item = snapshot.data?.items[index];

                                    if (item.isDeleted) {
                                      return Container();
                                    }

                                    return AnimatedBuilder(
                                      animation: animationController!,
                                      builder: (BuildContext context, Widget? child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: Transform(
                                            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
                                            child: InkWell(
                                              splashColor: AppTheme.transparent,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext context) => ItemScreen(
                                                      itemId: item.id,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: SizedBox(
                                                height: 280,
                                                child: Indexer(
                                                  children: [
                                                    Indexed(
                                                      index: 2,
                                                      child: Stack(
                                                        alignment: AlignmentDirectional.bottomCenter,
                                                        children: <Widget>[
                                                          Column(
                                                            children: <Widget>[
                                                              Expanded(
                                                                child: Container(
                                                                  height: 400,
                                                                  decoration: BoxDecoration(
                                                                    color: HexColor('#F8FAFB'),
                                                                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                                    border: Border.all(color: AppTheme.notWhite),
                                                                  ),
                                                                  child: Column(
                                                                    children: <Widget>[
                                                                      Expanded(
                                                                        child: Column(
                                                                          children: <Widget>[
                                                                            Align(
                                                                              alignment: Alignment.centerLeft,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                                                                child: Text(
                                                                                  item.product.name,
                                                                                  maxLines: 3,
                                                                                  overflow: TextOverflow.fade,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: const TextStyle(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.27,
                                                                                    color: AppTheme.darkerText,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    item.product.brand,
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow.fade,
                                                                                    textAlign: TextAlign.left,
                                                                                    style: const TextStyle(
                                                                                      fontWeight: FontWeight.w200,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.27,
                                                                                      color: AppTheme.grey,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            getExpirationDate(item),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 90,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 90,
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                                boxShadow: <BoxShadow>[
                                                                  BoxShadow(
                                                                      color: AppTheme.grey.withOpacity(0.2),
                                                                      offset: const Offset(0.0, 0.0),
                                                                      blurRadius: 6.0),
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                                child: AspectRatio(
                                                                  aspectRatio: 1.28,
                                                                  child: Image.network(
                                                                    ApiConstants.baseUrl + item.product.imagePath,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
