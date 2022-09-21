import 'package:alert_app/design_course_app_theme.dart';
import 'package:flutter/material.dart';

AppBar appBarUI() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Choose your',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: DesignCourseAppTheme.grey,
            ),
          ),
          Text(
            'Design Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ],
      ),
    ),
    shadowColor: Colors.white,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 2),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Image.asset('assets/userImage.png'),
        ),
      ),
    ],
  );
}
