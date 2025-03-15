import 'dart:async';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:apk_mobile/view/log/sign_in.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: AppColors.lightBlue,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, //untuk mengambil ruang yang dibutuhkan content saja
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/splash-screen.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Yudi Store",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            // Animasi loading screen
            const SizedBox(
              height: 12,
            ),
            const SpinKitWave(
              color: Colors.white,
              size: 24.0,
              duration: Duration(milliseconds: 1500),
            )
          ],
        ),
      ),
      onAnimationEnd: () {
        debugPrint("On Fade In End");
        Timer(const Duration(milliseconds: 1500), () {});
      },
      nextScreen: const SignInScreen(),
      duration: const Duration(milliseconds: 3000),
    );
  }
}
