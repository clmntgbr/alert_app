import 'package:alert_app/api_service.dart';
import 'package:alert_app/app_theme.dart';
import 'package:alert_app/models/get_active_store.dart';
import 'package:alert_app/util/curve_painter.dart';
import 'package:alert_app/util/hex_color.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  int selectedIndex = 0;
  late Widget selectedWidget;

  @override
  void initState() {
    selectedWidget = const HomeScreen();
    super.initState();
  }

  Future<void> barCodeScan() async {
    await BarcodeScanner.scan().then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor('#f2f3f9'),
        body: selectedWidget,
        floatingActionButton: FloatingActionButton(
          onPressed: barCodeScan,
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.camera_sharp, size: 40),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          opacity: .2,
          currentIndex: selectedIndex,
          onTap: onPressed,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ), //border radius doesn't work when the notch is enabled.
          elevation: 8,
          tilesPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          items: const <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              showBadge: false,
              badge: Text("5"),
              badgeColor: Colors.redAccent,
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text(""),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.deepPurple,
                icon: Icon(
                  Icons.access_time,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.access_time,
                  color: Colors.deepPurple,
                ),
                title: Text("")),
            BubbleBottomBarItem(
                backgroundColor: Colors.indigo,
                icon: Icon(
                  Icons.folder_open,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.folder_open,
                  color: Colors.indigo,
                ),
                title: Text("")),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
                title: Text(""))
          ],
        ),
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        selectedWidget = const HomeScreen();
      } else if (index == 1) {
        selectedWidget = const NotificationScreen();
      } else if (index == 2) {
        selectedWidget = const LocationScreen();
      } else if (index == 3) {
        selectedWidget = const MessagesScreen();
      } else if (index == 4) {
        selectedWidget = const ProfileScreen();
      }
    });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  ActiveStore activeStore = activeStoreInit();

  @override
  void initState() {
    super.initState();

    ApiService().getActiveStore().then((value) {
      setState(() {
        activeStore = value;
      });
    });
  }

  Color getStoreColor(int remainingPlaces) {
    if (remainingPlaces < 75) {
      return Colors.green;
    } else if (remainingPlaces >= 75 && remainingPlaces <= 95) {
      return Colors.orange;
    } else if (remainingPlaces > 95) {
      return Colors.red;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    int remainingPlaces = activeStore.maxItemPerStore - activeStore.itemsInStore;
    var remainingPlacesColor = getStoreColor(activeStore.itemsInStore);

    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(top: 55, left: 16, right: 16),
          child: Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(color: AppTheme.grey.withOpacity(0.2), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: HexColor('#87A0E5').withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, bottom: 2),
                                            child: Text('Nombre de produits',
                                                textAlign: TextAlign.center, style: AppTheme.appFont(fontSize: 12, fontWeight: FontWeight.w900)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 28,
                                                height: 28,
                                                child: Image.asset("assets/eaten.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 4, bottom: 3),
                                                child: Countup(
                                                  begin: 0,
                                                  end: activeStore.itemsInStore.toDouble(),
                                                  duration: const Duration(seconds: 3),
                                                  separator: ',',
                                                  style: const TextStyle(
                                                    fontFamily: AppTheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: AppTheme.darkerText,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: HexColor('#F56E98').withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, bottom: 2),
                                            child: Text('Places disponibles',
                                                textAlign: TextAlign.center, style: AppTheme.appFont(fontSize: 12, fontWeight: FontWeight.w900)),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 28,
                                                height: 28,
                                                child: Image.asset("assets/burned.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 4, bottom: 3),
                                                child: Countup(
                                                  begin: 0,
                                                  end: remainingPlaces.toDouble(),
                                                  duration: const Duration(seconds: 3),
                                                  separator: ',',
                                                  style: const TextStyle(
                                                    fontFamily: AppTheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: AppTheme.darkerText,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                      border: Border.all(width: 4, color: remainingPlacesColor.withOpacity(0.2)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Countup(
                                          begin: 0,
                                          end: remainingPlaces.toDouble(),
                                          duration: const Duration(seconds: 3),
                                          separator: ',',
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 24,
                                            letterSpacing: 0.0,
                                            color: remainingPlacesColor,
                                          ),
                                        ),
                                        Text('places \n restantes',
                                            textAlign: TextAlign.center, style: AppTheme.appFont(fontWeight: FontWeight.bold, fontSize: 11)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CustomPaint(
                                    painter: CurvePainter(
                                        colors: [remainingPlacesColor, HexColor("#8A98E8"), HexColor("#8A98E8")],
                                        angle: (remainingPlaces / 100) * 60),
                                    child: const SizedBox(
                                      width: 108,
                                      height: 108,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                    child: Container(
                      height: 2,
                      decoration: const BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Produits expirés',
                                  textAlign: TextAlign.center, style: AppTheme.appFont(fontWeight: FontWeight.w900, color: AppTheme.darkText)),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Container(
                                  height: 4,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F56E98').withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            HexColor('#F56E98'),
                                            HexColor('#F56E98').withOpacity(0.5),
                                          ]),
                                          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Countup(
                                    begin: 0,
                                    end: activeStore.itemsExpiredInStore.toDouble(),
                                    duration: const Duration(seconds: 3),
                                    separator: ',',
                                    style: AppTheme.appFont(fontWeight: FontWeight.w600, fontSize: 16, color: AppTheme.darkerText)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notification Screen"));
  }
}

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Location Screen"));
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messages Screen"));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}
