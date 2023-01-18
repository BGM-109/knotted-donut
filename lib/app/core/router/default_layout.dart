import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knotted_donut_tdd/app/core/common/responsive_center.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';
import 'package:knotted_donut_tdd/app/features/store/view/store_view.dart';
import 'package:knotted_donut_tdd/app/features/user/view/user_view.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout(
      {super.key, required this.child, this.bottonNavigationWidget});
  final Widget child;
  final Widget? bottonNavigationWidget;
  @override
  Widget build(BuildContext context) {
    final String location = GoRouter.of(context).location;
    const List<String> constList = ["/", "/user", "/store"];

    int getCurrentIndex(String route) {
      if (route.startsWith('/store')) return 1;
      if (route.startsWith('/user')) return 2;
      return 0;
    }

    void onTap(int i) {
      switch (i) {
        case 0:
          context.goNamed(MainView.routeName);
          break;
        case 1:
          context.goNamed(StoreView.routeName);
          break;
        case 2:
          context.goNamed(UserView.routeName);
          break;
      }
    }

    Widget? buildBottomNav(String route) {
      if (constList.contains(route)) {
        return BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: getCurrentIndex(location),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: "Order"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: "User")
          ],
        );
      }
      return null;
    }

    return ResponsiveCenter(
        child: Scaffold(
            body: child, bottomNavigationBar: buildBottomNav(location)));
  }
}
