// import 'package:apk_mobile/view/Produk/category_produk.dart';
import 'package:apk_mobile/view/Produk/all_food_list.dart';
import 'package:apk_mobile/view/Produk/category_produk.dart';
import 'package:apk_mobile/view/Checkout/checkout_screen.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final searchBar = TextEditingController();
  final Map<String, dynamic> product = {};
  int jumlahMakanan = 1;

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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
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
                  // Categori screen
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories Product',
                          style: CustomText.title
                              .copyWith(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CategoryProduk()
                      ],
                    ),
                  ),

                  // Product screen
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Product',
                          style: CustomText.title
                              .copyWith(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AllFoodList()
                      ],
                    ),
                  )
                ],
              ),
            ),
            onRefresh: () async {
              setState(() {});
            }));
  }
}
