import 'package:alert_app/custom_icons.dart';
import 'package:alert_app/screen/home_screen.dart';
import 'package:alert_app/screen/store_screen.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
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
  int selectedIndex = 0;
  late Widget selectedWidget;

  @override
  void initState() {
    selectedWidget = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: selectedWidget,
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 222, 224, 225),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          snakeViewColor: Colors.redAccent,
          selectedItemColor: SnakeShape.circle == SnakeShape.indicator ? Colors.redAccent : null,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) => onPressed(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'tickets',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_sharp,
                  size: 40,
                ),
                label: 'calendar'),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.podcasts),
              label: 'microphone',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.search),
              label: 'search',
            )
          ],
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  void onPressed(index) {
    setState(
      () {
        selectedIndex = index;
        if (index == 0) {
          selectedWidget = const HomeScreen();
        } else if (index == 1) {
          selectedWidget = const StoreScreen();
        } else if (index == 2) {
          barCodeScan();
        } else if (index == 3) {
          selectedWidget = const MessagesScreen();
        } else if (index == 4) {
          selectedWidget = const ProfileScreen();
        }
      },
    );
  }

  Future<void> barCodeScan() async {
    await BarcodeScanner.scan().then(
      (value) => Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const AppScreen(),
        ),
      ),
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
            children: const <Widget>[
              Text('2'),
              SizedBox(height: 16),
              Text('2'),
              SizedBox(height: 16),
              Text('2'),
              SizedBox(height: 16),
              Text('2'),
              SizedBox(height: 16),
              Text('2'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
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
            children: const <Widget>[
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('3'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
              Text('podkqspodkqpsdkpqsdkpqskdpqsok'),
              SizedBox(height: 16),
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
