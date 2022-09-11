import 'package:alert_app/app_text.dart';
import 'package:alert_app/grocery_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GroceryItemCardWidget extends StatelessWidget {
  const GroceryItemCardWidget({Key? key, required this.item}) : super(key: key);
  final GroceryItem item;

  final double width = 180;
  final double height = 250;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(right: 15),
      onPressed: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
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
                    tag: "GroceryItem:${item.name}",
                    child: imageWidget(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppText(
                text: item.name,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: item.description,
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
                    text: '${item.price}',
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
    );
  }

  Widget imageWidget() {
    return Image.asset(item.imagePath);
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
