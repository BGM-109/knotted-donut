import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knotted_donut_tdd/app/features/cart/view/cart_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_view.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';
import 'package:knotted_donut_tdd/app/features/user/view/user_view.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout(
      {super.key, required this.child, this.bottonNavigationWidget});
  final Widget child;
  final Widget? bottonNavigationWidget;
  @override
  Widget build(BuildContext context) {
    final String location = GoRouter.of(context).location;
    const List<String> constList = ["/", "/user"];
    int getCurrentIndex(String route) {
      if (route.startsWith('/donut')) return 1;
      if (route.startsWith('/user')) return 2;
      return 0;
    }

    void onTap(int i) {
      switch (i) {
        case 0:
          context.goNamed(MainView.routeName);
          break;
        case 1:
          context.pushNamed(DonutView.routeName);
          break;
        case 2:
          context.goNamed(UserView.routeName);
          break;
      }
    }

    Widget buildCartIcon(String route) {
      if (constList.contains(route)) {
        return IconButton(
            onPressed: () {
              context.pushNamed(CartView.routeName);
            },
            icon: const Icon(Icons.shopping_bag));
      }
      return Container();
    }

    AppBar? buildAppBar(String route) {
      if (constList.contains(route)) {
        return AppBar(
          title: Text(location),
          actions: [buildCartIcon(location)],
        );
      }
      return null;
    }

    Widget? buildBottomNav(String route) {
      if (constList.contains(route)) {
        return BottomNavigationBar(
          onTap: onTap,
          currentIndex: getCurrentIndex(location),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Hoem"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shop,
                ),
                label: "Order"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: "User")
          ],
        );
      }
      return null;
    }

    return Scaffold(
        appBar: buildAppBar(location),
        body: child,
        bottomNavigationBar: buildBottomNav(location));
  }
}
