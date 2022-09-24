import 'package:alert_app/custom_icons.dart';
import 'package:alert_app/home_design_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnakeNavigationBar Example ',
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  AppScreenState createState() => AppScreenState();
}

class AppScreenState extends State<AppScreen> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);
  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  Color selectedColor = Colors.redAccent;
  Color unselectedColor = Colors.blueGrey;

  int selectedIndex = 0;
  late Widget selectedWidget;

  @override
  void initState() {
    selectedWidget = DesignCourseHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: selectedWidget,
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25), side: BorderSide(color: Color.fromARGB(255, 222, 224, 225))),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        snakeViewColor: Colors.redAccent,
        selectedItemColor: SnakeShape.circle == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) => onPressed(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'tickets'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_sharp,
                size: 40,
              ),
              label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.podcasts), label: 'microphone'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.search), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  void onPressed(index) {
    setState(
      () {
        selectedIndex = index;
        if (index == 0) {
          selectedWidget = DesignCourseHomeScreen();
        } else if (index == 1) {
          selectedWidget = const NotificationScreen();
        } else if (index == 2) {
          selectedWidget = const LocationScreen();
        } else if (index == 3) {
          selectedWidget = const MessagesScreen();
        } else if (index == 4) {
          selectedWidget = const ProfileScreen();
        }
      },
    );
  }
}

class PagerPageWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Image? image;
  final TextStyle titleStyle = const TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
  final TextStyle subtitleStyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w200,
  );

  const PagerPageWidget({
    Key? key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait ? _portraitWidget() : _horizontalWidget(context);
        }),
      ),
    );
  }

  Widget _portraitWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(text!, style: titleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
          ],
        ),
        image!
      ],
    );
  }

  Widget _horizontalWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(text!, style: titleStyle),
              Text(description!, style: subtitleStyle),
            ],
          ),
        ),
        Expanded(child: image!)
      ],
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('2'),
              const SizedBox(height: 16),
              Text('2'),
              const SizedBox(height: 16),
              Text('2'),
              const SizedBox(height: 16),
              Text('2'),
              const SizedBox(height: 16),
              Text('2'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('3'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              const SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
            ],
          ),
        ],
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Messages Screen"),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Screen"),
    );
  }
}
