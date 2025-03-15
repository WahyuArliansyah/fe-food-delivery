import 'package:apk_mobile/view/Homepage/ads_diskon.dart';
import 'package:apk_mobile/view/Homepage/best_seller.dart';
import 'package:apk_mobile/view/Homepage/discount_product_list.dart';
import 'package:apk_mobile/view/Homepage/new_product_list.dart';
import 'package:apk_mobile/view/Checkout/checkout_screen.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({this.onNavigateToBooking, super.key});
  final Function? onNavigateToBooking;

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final searchBar = TextEditingController();
  int jumlahMakanan = 1;

  // Definisikan product yang akan dikirim ke CheckoutScreen
  final Map<String, dynamic> product = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.lightBlue, // Warna latar belakang AppBar
          elevation: 2, // Shadow kecil untuk AppBar
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Warna latar belakang search bar
              borderRadius:
                  BorderRadius.circular(10), // Border radius search bar
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[600]), // Ikon search
                border: InputBorder.none, // Menghilangkan border
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10), // Padding untuk teks
              ),
            ),
          ),
          actions: [
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 5),
              badgeContent: const Text(
                '22',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart,
                    color: Colors.white), // Ikon keranjang belanja
                onPressed: () {
                  // Aksi ketika keranjang belanja ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                          product: product, jumlahMakanan: jumlahMakanan),
                    ),
                  );
                },
              ),
            ),
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeContent: const Text(
                '32',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: IconButton(
                icon: const Icon(Icons.chat_rounded,
                    color: Colors.white), // Ikon keranjang belanja
                onPressed: () {
                  // Aksi ketika keranjang belanja ditekan
                },
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  // Discount
                  const SizedBox(
                    height: 200,
                    child: AdsDiskon(),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // produk list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Product',
                          style: CustomText.title.copyWith(
                              fontStyle: FontStyle.italic, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.onNavigateToBooking != null) {
                              widget.onNavigateToBooking!();
                            }
                          },
                          child: const Text('See All ->',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.lightBlue)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 240,
                    child: NewProductList(),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // produk list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount Product',
                          style: CustomText.title.copyWith(
                              fontStyle: FontStyle.italic, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.onNavigateToBooking != null) {
                              widget.onNavigateToBooking!();
                            }
                          },
                          child: const Text('See All ->',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.lightBlue)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 240,
                    child: DiscountProductList(),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // produk list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Seller',
                          style: CustomText.title.copyWith(
                              fontStyle: FontStyle.italic, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.onNavigateToBooking != null) {
                              widget.onNavigateToBooking!();
                            }
                          },
                          child: const Text('See All ->',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.lightBlue)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 240,
                    child: BestSeller(),
                  ),
                ],
              ),
            ),
            onRefresh: () async {
              setState(() {});
            }));
  }
}
