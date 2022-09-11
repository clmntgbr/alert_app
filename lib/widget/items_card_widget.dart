import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/models/get_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({Key? key, required this.item}) : super(key: key);
  final Items item;

  @override
  Widget build(BuildContext context) {
    Row alertAt = Row(
      children: [
        const Icon(
          Icons.notifications_none,
          size: 14.0,
        ),
        Text(
          '  ${item.expirationDate}',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        addWidget()
      ],
    );

    return MaterialButton(
        onPressed: () async {
          debugPrint('${item.id}');
        },
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffE2E2E2),
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                imageWidget(),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Text(item.product.name, style: AppTheme.appFont(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text(item.product.brand,
                    style: AppTheme.appFont(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C7C7C),
                    )),
                const SizedBox(
                  height: 10,
                ),
                alertAt
              ],
            ),
          ),
        ));
  }

  Widget imageWidget() {
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: Image.network(ApiConstants.baseUrl + item.product.imagePath, fit: BoxFit.contain, alignment: Alignment.topCenter),
    );
  }

  Widget addWidget() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.redAccent),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
