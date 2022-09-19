import 'package:alert_app/api_service.dart';
import 'package:alert_app/app_theme.dart';
import 'package:alert_app/models/get_active_store.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  GetActiveStore activeStore = activeStoreInit();

  @override
  void initState() {
    super.initState();

    ApiService().getActiveStore().then((value) {
      setState(() {
        activeStore = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int remainingPlaces = activeStore.maxItemPerStore - activeStore.itemsInStore;

    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0),
            ),
            border: Border.all(
              color: const Color(0xffE2E2E2),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
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
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 4, bottom: 2),
                                        child: Text(
                                          'Nombre de produits',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white),
                                        ),
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
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: AppTheme.nearlyWhite,
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
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 4, bottom: 2),
                                        child: Text(
                                          'Places disponibles',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
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
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.white,
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
                      padding: const EdgeInsets.only(right: 15),
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
                                  color: Colors.redAccent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white,
                                  ),
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
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24,
                                        letterSpacing: 0.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'places \n restantes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
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
                          const Text(
                            'Produits expirés',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w900, color: AppTheme.nearlyWhite),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              height: 4,
                              width: 130,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 130,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
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
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppTheme.nearlyWhite),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
