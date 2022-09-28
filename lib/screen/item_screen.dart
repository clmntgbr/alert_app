import 'package:alert_app/api/api_item.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_item.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({super.key, required this.itemId});

  int itemId;

  @override
  ItemScreenState createState() => ItemScreenState();
}

class ItemScreenState extends State<ItemScreen> {
  final double infoHeight = 364.0;
  late GetItem item = getItemInit();

  @override
  void initState() {
    ApiItem().getItem(widget.itemId, context).then((value) {
      setState(() {
        item = value;
      });
    });
    super.initState();
  }

  Widget getImageProfile(GetItem item) {
    if (item.product.id == 0) {
      return Image.asset('assets/webInterFace.png');
    }

    return Image.network(
      ApiConstants.baseUrl + item.product.imagePath,
      fit: BoxFit.contain,
    );
  }

  Color getLikeIconBackgroundColor(GetItem item) {
    if (item.isLiked) {
      return AppTheme.secondaryColor;
    }
    return AppTheme.white;
  }

  Color getLikeIconColor(GetItem item) {
    if (item.isLiked) {
      return AppTheme.white;
    }
    return AppTheme.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0;
    return Container(
      color: AppTheme.white,
      child: Scaffold(
        backgroundColor: AppTheme.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: getImageProfile(item),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: AppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(minHeight: infoHeight, maxHeight: tempHeight > infoHeight ? tempHeight : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16),
                            child: Text(
                              item.product.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: AppTheme.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  '\$28.99',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: AppTheme.secondaryColor,
                                  ),
                                ),
                                Row(
                                  children: const <Widget>[
                                    Text(
                                      '4.3',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 22,
                                        letterSpacing: 0.27,
                                        color: AppTheme.grey,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.secondaryColor,
                                      size: 24,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: <Widget>[
                                getTimeBoxUI('24', 'Classe'),
                                getTimeBoxUI('2hours', 'Time'),
                                getTimeBoxUI('24', 'Seat'),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                              child: Text(
                                'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14,
                                  letterSpacing: 0.27,
                                  color: AppTheme.grey,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                      border: Border.all(color: AppTheme.grey.withOpacity(0.2)),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppTheme.secondaryColor,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppTheme.secondaryColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(color: AppTheme.secondaryColor.withOpacity(0.5), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Join Course',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: MaterialButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  ApiItem().putItemLiked(item.id, !item.isLiked);
                  setState(() {
                    item.isLiked = !item.isLiked;
                  });
                },
                child: Card(
                  color: getLikeIconBackgroundColor(item),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: getLikeIconColor(item),
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: AppTheme.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: AppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.secondaryColor,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: AppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
