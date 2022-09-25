import 'package:alert_app/app_theme.dart';
import 'package:alert_app/constants.dart';
import 'package:alert_app/model/get_user.dart';
import 'package:flutter/material.dart';

PreferredSize appBarUI(GetUser getUser) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: AppBar(
      shape: const Border(bottom: BorderSide(color: Color.fromARGB(255, 227, 229, 230), width: 1)),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.2,
                color: AppTheme.grey,
              ),
            ),
            Text(
              getUser.user.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 0.27,
                color: AppTheme.darkerText,
              ),
            ),
          ],
        ),
      ),
      shadowColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: SizedBox(
            width: 50,
            height: 50,
            child: getImageProfile(getUser),
          ),
        ),
      ],
    ),
  );
}

Widget getImageProfile(GetUser getUser) {
  if (getUser.user.id == 0) {
    return Image.asset('assets/userImage.png');
  }

  return Image.network(
    ApiConstants.baseUrl + getUser.user.imagePath,
    fit: BoxFit.contain,
  );
}
