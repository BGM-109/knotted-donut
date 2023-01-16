import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/core/util/dragable_single_child_scroll_view.dart';
import 'package:knotted_donut_tdd/app/features/alarm/alarm_view.dart';
import 'package:knotted_donut_tdd/app/features/auth/providers/auth_providers.dart';
import 'package:knotted_donut_tdd/app/features/banner/banner_model.dart';
import 'package:knotted_donut_tdd/app/features/banner/banner_providers.dart';
import 'package:knotted_donut_tdd/app/features/dialog/widget/barcode_dialog.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';

final carouselIndexProvider = StateProvider.autoDispose<int?>((ref) => 0);

class MainView extends HookConsumerWidget {
  const MainView({super.key});

  static const String routeName = 'main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scroll = useScrollController();
    final scrollSecond = useScrollController();
    final displayName = ref.watch(getUserNameProvider);
    const int stamp = 0;
    const int coupon = 0;
    const double statusBarHeight = 70;
    final width = MediaQuery.of(context).size.width;
    final banners = ref.watch(getBannerProvider);
    final instagram = ref.watch(getInstagramProvider);
    final bestDonuts = ref.watch(getBestDonutProvider);
    final index = ref.watch(carouselIndexProvider);

    Widget buildMainHeader(String text) => Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20));

    void slideUpDialog() {
      showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeIn.transform(a1.value);
          var height = MediaQuery.of(context).size.height;
          return Transform.translate(
            offset: Offset(0, (height / 2) * (1 - curve)),
            child: const BarcodeDialog(),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Transform.translate(
              offset: const Offset(0, -statusBarHeight),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: width,
                    height: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                              "assets/home_background.png",
                            ))),
                  ),
                  Positioned(
                    top: statusBarHeight - 10,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            slideUpDialog();
                          },
                          icon: const Icon(Icons.qr_code_scanner),
                        ),
                        IconButton(
                            onPressed: () {
                              context.goNamed(AlarmView.routeName);
                            },
                            icon: const Icon(Icons.notifications_outlined))
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: displayName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(
                          text: " 님 안녕하세요",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("스탬프 $stamp개 쿠폰 $coupon개"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AsyncValueWidget<List<BannerModel>>(
                      value: banners,
                      data: (data) => Stack(children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  height: 200,
                                  onPageChanged: (int? value, _) {
                                    ref
                                        .read(carouselIndexProvider.notifier)
                                        .state = value;
                                  },
                                  viewportFraction: 1),
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: CachedNetworkImage(
                                  imageUrl: data[itemIndex].img,
                                  width: width,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(24)),
                                width: 50,
                                height: 25,
                                child: Text("${index! + 1} / ${data.length}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                            )
                          ])),
                  const SizedBox(
                    height: 24,
                  ),
                  buildMainHeader("베스트 메뉴"),
                  AsyncValueWidget<List<DonutModel>>(
                      value: bestDonuts,
                      data: (data) => DragableSingleChildScrollView(
                            controller: scroll,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: data
                                  .map((e) => GestureDetector(
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                                imageUrl: e.img,
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.contain),
                                            const SizedBox(width: 24)
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )),
                  const SizedBox(
                    height: 24,
                  ),
                  buildMainHeader("인스타 그램"),
                  AsyncValueWidget<List<BannerModel>>(
                      value: instagram,
                      data: (data) => DragableSingleChildScrollView(
                            controller: scrollSecond,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: data
                                  .map((e) => Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: CachedNetworkImage(
                                                imageUrl: e.img,
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.cover),
                                          ),
                                          const SizedBox(width: 24)
                                        ],
                                      ))
                                  .toList(),
                            ),
                          )),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
