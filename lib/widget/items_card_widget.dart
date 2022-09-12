import 'package:alert_app/app_text.dart';
import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/models/get_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemsCardWidget extends StatelessWidget {
  const ItemsCardWidget({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {},
        child: Container(
          width: 180,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffE2E2E2),
            ),
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Hero(
                      tag: "GroceryItem:${item.product.name}",
                      child: imageWidget(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppText(
                  text: item.product.name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  text: item.product.brand,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7C7C7C),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    AppText(
                      text: '${item.product.id}',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    addWidget()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
      child: widget,
    );
  }

  static Widget getHorizontalItemSlider(Future<GetItems> items) {
    return FutureBuilder<GetItems>(
      future: items,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                itemCount: snapshot.data!.totalItems,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ItemsCardWidget(item: snapshot.data!.items[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 0,
                  );
                },
              ),
            ),
          );
        }
        return Container(
            padding: const EdgeInsets.all(50),
            child: const SizedBox(
              height: 100.0,
              width: 100.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
            ));
      },
    );
  }

  static Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: AppTheme.appFont(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const Spacer(),
        MaterialButton(
          textTheme: ButtonTextTheme.normal,
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            verticalDirection: VerticalDirection.up,
            textBaseline: TextBaseline.alphabetic,
            textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Tous  ",
                style: AppTheme.appFont(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget imageWidget() {
    return Image.network(
      ApiConstants.baseUrl + item.product.imagePath,
      fit: BoxFit.cover,
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: Colors.redAccent),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
