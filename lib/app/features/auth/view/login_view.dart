import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/core/common/responsive_center.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "login";
  @override
  Widget build(BuildContext context) {
    return ResponsiveCenter(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/login_background.png",
                ))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 100,
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(242, 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text(
                        "로그인 하기",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
            ),
          ],
        ),
      )),
    );
  }
}
