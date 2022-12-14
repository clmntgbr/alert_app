import 'package:alert_app/api/api_item.dart';
import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_items.dart';
import 'package:alert_app/screen/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class ItemsListView extends StatefulWidget {
  ItemsListView({Key? key, required this.getItems}) : super(key: key);

  late Future<GetItems> getItems;

  @override
  ItemsListViewState createState() => ItemsListViewState();
}

class ItemsListViewState extends State<ItemsListView> with TickerProviderStateMixin {
  AnimationController? animationController;
  int totalItems = -1;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Indexed getExpirationDate(Item item) {
    if (item.expirationDate != null) {
      return Indexed(
        index: 2,
        child: Positioned(
          left: (280 - 48) / 2,
          bottom: 10,
          child: Row(
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
        ),
      );
    }

    return Indexed(child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 5),
      child: FutureBuilder<GetItems>(
        future: widget.getItems,
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

          return SizedBox(
            height: 135,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
              itemCount: totalItems,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final int count = totalItems;
                final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(parent: animationController!, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
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
                        transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
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
                            width: 280,
                            height: double.infinity,
                            child: Stack(
                              children: <Widget>[
                                Indexer(
                                  children: [
                                    Indexed(
                                      index: 10,
                                      child: Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: AppTheme.transparent,
                                          ),
                                          alignment: Alignment.center,
                                          width: 40,
                                          height: 40,
                                          padding: const EdgeInsets.all(0),
                                          child: IconButton(
                                              icon: const Icon(
                                                Icons.delete_outline_rounded,
                                                color: AppTheme.secondaryColor,
                                                size: 26,
                                              ),
                                              onPressed: () {
                                                ApiItem().deleteItem(item.id);
                                                setState(() {
                                                  totalItems--;
                                                  item.isDeleted = true;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    getExpirationDate(item),
                                    Indexed(
                                      index: 1,
                                      child: Row(
                                        children: <Widget>[
                                          const SizedBox(
                                            width: 48,
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: HexColor('#F8FAFB'),
                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                border: Border.all(color: AppTheme.black.withOpacity(0.1)),
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  const SizedBox(
                                                    width: 48 + 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 16),
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
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Indexed(
                                      index: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                border: Border.all(color: AppTheme.black.withOpacity(0.2)),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                child: AspectRatio(
                                                  aspectRatio: 1.0,
                                                  child: Image.network(
                                                    ApiConstants.baseUrl + item.product.imagePath,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
    );
  }
}
