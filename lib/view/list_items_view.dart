import 'package:alert_app/api_service.dart';
import 'package:alert_app/models/category.dart';
import 'package:alert_app/models/get_items.dart';
import 'package:alert_app/view/list_item_view.dart';
import 'package:flutter/material.dart';

class ListExpiredItemsView extends StatefulWidget {
  const ListExpiredItemsView({Key? key}) : super(key: key);

  @override
  ListExpiredItemsViewState createState() => ListExpiredItemsViewState();
}

class ListExpiredItemsViewState extends State<ListExpiredItemsView> with TickerProviderStateMixin {
  AnimationController? animationController;

  late Future<GetItems> itemsExpireSoonLimited;
  late Future<GetItems> itemsExpiredLimited;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    itemsExpiredLimited = ApiService().getItemsExpiredLimited();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: SizedBox(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<GetItems>(
          future: itemsExpiredLimited,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                itemCount: snapshot.data?.totalItems,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10 ? 10 : Category.categoryList.length;
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(parent: animationController!, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return ListItemView(
                    item: snapshot.data?.items[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ListExpireSoonItemsView extends StatefulWidget {
  const ListExpireSoonItemsView({Key? key}) : super(key: key);

  @override
  ListExpireSoonItemsViewState createState() => ListExpireSoonItemsViewState();
}

class ListExpireSoonItemsViewState extends State<ListExpireSoonItemsView> with TickerProviderStateMixin {
  AnimationController? animationController;

  late Future<GetItems> itemsExpireSoon;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    itemsExpireSoon = ApiService().getItemsExpireSoonLimited(context);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: SizedBox(
        height: 134,
        width: double.infinity,
        child: FutureBuilder<GetItems>(
          future: itemsExpireSoon,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                itemCount: snapshot.data?.totalItems,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10 ? 10 : Category.categoryList.length;
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(parent: animationController!, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return ListItemView(
                    item: snapshot.data?.items[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
