import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/router/default_layout.dart';
import 'package:knotted_donut_tdd/app/features/alarm/alarm_view.dart';
import 'package:knotted_donut_tdd/app/features/auth/view/login_view.dart';
import 'package:knotted_donut_tdd/app/features/cart/view/cart_view.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_result_view.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_detail_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_view.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';
import 'package:knotted_donut_tdd/app/features/error/page_not_found.dart';
import 'package:knotted_donut_tdd/app/features/search/view/search_view.dart';
import 'package:knotted_donut_tdd/app/features/user/view/user_view.dart';

final routerNotifierProvider =
    ChangeNotifierProvider<RouterNotifier>((ref) => RouterNotifier());

class RouterNotifier extends ChangeNotifier {
  bool isLoggedIn = false;
  set setLogin(bool value) => isLoggedIn = value;

  RouterNotifier() {
    if (FirebaseAuth.instance.currentUser != null) {
      isLoggedIn = true;
    }
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn = false;
      }
    });
  }
}

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    final notifier = ref.read(routerNotifierProvider);
    return GoRouter(
      redirectLimit: 3,
      redirect: (context, state) {
        // if the user is not logged in, they need to login
        final loggedIn = notifier.isLoggedIn;
        final loggingIn = state.subloc == '/login';

        if (!loggedIn) return loggingIn ? null : '/login';

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) return '/';

        // no need to redirect at all
        return null;
      },
      refreshListenable: notifier,

      initialLocation: '/',
      errorBuilder: (context, state) => const PageNotFound(),
      // 라우팅 체크메이드
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/login',
          name: LoginView.routeName,
          builder: (context, state) => const LoginView(),
        ),
        ShellRoute(
            builder: (context, state, child) {
              return DefaultLayout(child: child);
            },
            routes: [
              GoRoute(
                  path: '/',
                  name: MainView.routeName,
                  builder: (context, state) => const MainView(),
                  routes: [
                    GoRoute(
                      path: 'alarm',
                      name: AlarmView.routeName,
                      builder: (context, state) => const AlarmView(),
                    ),
                  ]),
              GoRoute(
                  path: '/donut',
                  name: DonutView.routeName,
                  builder: (context, state) => const DonutView(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: DonutDetailView.routeName,
                      builder: (context, state) {
                        final id = state.params['id'];
                        return DonutDetailView(id: id);
                      },
                    ),
                    GoRoute(
                      path: 'search',
                      name: SearchView.routeName,
                      builder: (context, state) => const SearchView(),
                    ),
                  ]),
              GoRoute(
                path: '/user',
                name: UserView.routeName,
                builder: (context, state) => const UserView(),
              ),
              GoRoute(
                  path: '/cart',
                  name: CartView.routeName,
                  builder: (context, state) => const CartView(),
                  routes: [
                    GoRoute(
                      path: 'checkout',
                      name: CheckOutView.routeName,
                      builder: (context, state) => const CheckOutView(),
                    ),
                  ]),
              GoRoute(
                  path: '/result',
                  name: CheckoutResultView.routeName,
                  builder: (context, state) => const CheckoutResultView())
            ]),

        /// for showing onboarding
      ],
    );
  },
);
