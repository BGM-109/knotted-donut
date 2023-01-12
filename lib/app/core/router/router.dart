import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/router/default_layout.dart';
import 'package:knotted_donut_tdd/app/features/cart/view/cart_view.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_result_view.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_view.dart';
import 'package:knotted_donut_tdd/app/features/main/view/main_view.dart';
import 'package:knotted_donut_tdd/app/features/not_found/page_not_found.dart';
import 'package:knotted_donut_tdd/app/features/user/view/user_view.dart';

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state) => const PageNotFound(),
      // 라우팅 체크메이드
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return DefaultLayout(child: child);
            },
            routes: [
              GoRoute(
                path: '/',
                name: MainView.routeName,
                builder: (context, state) => const MainView(),
              ),
              GoRoute(
                path: '/donut',
                name: DonutView.routeName,
                builder: (context, state) => const DonutView(),
              ),
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
