import 'package:apk_mobile/view/Produk/all_produk.dart';
import 'package:apk_mobile/view/Homepage/homepage_screen.dart';
import 'package:apk_mobile/view/ProfilePage/profile_screen.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class ButtonDashboard extends StatefulWidget {
  const ButtonDashboard({super.key});

  @override
  State<ButtonDashboard> createState() => _ButtonDashboardState();
}

class _ButtonDashboardState extends State<ButtonDashboard> {
  int idx = 0;

  void onItemTemp(int index) {
    setState(() {
      idx = index;
    });
  }

  getBody(int index) {
    switch (idx) {
      case 0:
        return HomepageScreen(
          onNavigateToBooking: () {
            setState(() {
              idx = 1;
            });
          },
        );
      case 1:
        return const BookingScreen();
      case 2:
        return const ProfileScreen();
      default:
        return HomepageScreen(
          onNavigateToBooking: () {
            setState(() {
              idx = 1;
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(idx),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.lightBlue
            // color: AppColors.lightBlue,
            ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: idx,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed, // More dynamic appearance
          onTap: onItemTemp,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              activeIcon: Icon(Icons.fastfood, color: Colors.white),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person, color: Colors.white),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
