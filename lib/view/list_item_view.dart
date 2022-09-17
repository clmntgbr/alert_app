import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/models/get_items.dart';
import 'package:alert_app/util/hex_color.dart';
import 'package:alert_app/widget/items_widget.dart';
import 'package:flutter/material.dart';

class ListItemView extends StatefulWidget {
  const ListItemView({Key? key, this.item, this.animationController, this.animation}) : super(key: key);

  final Item? item;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  ListItemViewState createState() => ListItemViewState();
}

class ListItemViewState extends State<ListItemView> {
  @override
  Widget build(BuildContext context) {
    Item? item = widget.item;
    AnimationController? animationController = widget.animationController;
    Animation<double>? animation = widget.animation;

    return MaterialButton(
      onPressed: () {
        moveTo(context);
      },
      padding: const EdgeInsets.all(0),
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: null,
                child: SizedBox(
                  width: 280,
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 48 + 24.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Text(
                                            item!.product.name,
                                            textAlign: TextAlign.left,
                                            maxLines: 3,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              letterSpacing: 0.27,
                                              color: AppTheme.darkerText,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10, bottom: 8),
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
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: expirationDateAndIsLiked(item),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.network(
                                    ApiConstants.baseUrl + item.product.imagePath,
                                    fit: BoxFit.fitHeight,
                                  )),
                            )
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
      ),
    );
  }
}
