import 'package:apk_mobile/view/log/sign_in.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi layar
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: SizedBox(
            // Tambahkan SizedBox untuk mengatur tinggi minimum
            height: screenHeight,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/p.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ArliFood',
                      style: CustomText.title
                          .copyWith(fontSize: 40, color: Colors.black),
                    ),
                    Text(
                      'Delivering Fast Food',
                      style: CustomText.title
                          .copyWith(fontSize: 30, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text('Anda Lapar?',
                        style: CustomText.body.copyWith(color: Colors.black)),
                    Text('Saatnya Pesan Makan',
                        style: CustomText.body.copyWith(color: Colors.black)),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 190,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const SignInScreen(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  // posisi awal dari kanan (x:1, y:0)
                                  const begin = Offset(1.0, 0.0);
                                  // posisi akhirnya ditengah (x:0, y:0)
                                  const end = Offset.zero;
                                  final tween = Tween(begin: begin, end: end);
                                  final offsetAnimation =
                                      animation.drive(tween);

                                  return SlideTransition(
                                      position: offsetAnimation, child: child);
                                },
                                // durasi lamanya animasi
                                transitionDuration:
                                    const Duration(milliseconds: 800)));
                          },
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Get Started',
                                style: CustomText.body.copyWith(
                                    color: Colors.white, fontSize: 20),
                              ),
                              // const SizedBox(width: 40),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 25,
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
