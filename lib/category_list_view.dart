import 'package:alert_app/models/category.dart';
import 'package:alert_app/view/list_item_view.dart';
import 'package:flutter/material.dart';

class ListItemsView extends StatefulWidget {
  const ListItemsView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  ListItemsViewState createState() => ListItemsViewState();
}

class ListItemsViewState extends State<ListItemsView> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
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
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                itemCount: Category.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = Category.categoryList.length > 10 ? 10 : Category.categoryList.length;
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(parent: animationController!, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return ListItemView(
                    category: Category.categoryList[index],
                    animation: animation,
                    animationController: animationController,
                    callback: widget.callBack,
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
