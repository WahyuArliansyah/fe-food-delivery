import 'package:apk_mobile/view/detail-product/detail_product_discount.dart';
import 'package:apk_mobile/view/detail-product/detail_product_nondiscount.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class AllFoodList extends StatelessWidget {
  AllFoodList({super.key});

  final List<Map<String, dynamic>> allFood = [
    {
      'image': 'assets/images/all_produk/product_list1.jpg',
      'nama': 'Pop Ice',
      'category': 'Drinks',
      'rating': '4.8',
      'jarak': '5km',
      'waktu': '15min',
      'harga': 'Rp 12,000',
    },
    {
      'image': 'assets/images/all_produk/product_list2.jpg',
      'nama': 'Coffe Boba',
      'category': 'Drinks',
      'rating': '4.8',
      'jarak': '3km',
      'waktu': '10min',
      'harga': 'Rp 15,000',
    },
    {
      'image': 'assets/images/all_produk/product_list3.jpg',
      'nama': 'Chocolate Cake',
      'category': 'Deserts',
      'rating': '4.9',
      'jarak': '5km',
      'waktu': '15min',
      'harga': 'Rp 25,000',
    },
    {
      'image': 'assets/images/all_produk/product_list4.jpg',
      'nama': 'Kentang Goreng',
      'category': 'Snacks',
      'rating': '4.9',
      'jarak': '3km',
      'waktu': '10min',
      'discount': 'Rp 30,000',
      'harga': 'Rp 45,000',
    },
    {
      'image': 'assets/images/all_produk/product_list5.jpg',
      'nama': 'Shoyu Ramen',
      'category': 'Food',
      'rating': '4.8',
      'jarak': '5km',
      'waktu': '15min',
      'discount': 'Rp 35,000',
      'harga': 'Rp 50,000',
    },
    {
      'image': 'assets/images/all_produk/product_list6.jpg',
      'nama': 'Mie Gacoan',
      'category': 'Deserts',
      'rating': '4.8',
      'jarak': '10km',
      'waktu': '30min',
      'discount': 'Rp 5,000',
      'harga': 'Rp 15,000',
    },
    {
      'image': 'assets/images/all_produk/product_list7.jpg',
      'nama': 'Coffe Latte',
      'category': 'Drinks',
      'rating': '4.8',
      'jarak': '3km',
      'waktu': '10min',
      'harga': 'Rp 45,000',
    },
    {
      'image': 'assets/images/all_produk/product_list8.jpg',
      'nama': 'Humburger',
      'category': 'Food',
      'rating': '4.8',
      'jarak': '5km',
      'waktu': '15min',
      'harga': 'Rp 35,000',
    },
    {
      'image': 'assets/images/all_produk/product_list9.jpg',
      'nama': 'Brownie Sundae',
      'category': 'Dessert',
      'rating': '4.8',
      'jarak': '4km',
      'waktu': '12min',
      'harga': 'Rp 25,000',
    },
    {
      'image': 'assets/images/all_produk/product_list10.jpg',
      'nama': 'Mocachino Cincau',
      'category': 'Drinks',
      'rating': '4.9',
      'jarak': '3km',
      'waktu': '10min',
      'discount': 'Rp 10,000',
      'harga': 'Rp 25,000',
    },
    {
      'image': 'assets/images/all_produk/product_list11.jpg',
      'nama': 'Oreo Cheesecake',
      'category': 'Dessert',
      'rating': '4.8',
      'jarak': '10km',
      'waktu': '30min',
      'discount': 'Rp 21,000',
      'harga': 'Rp 38,000',
    },
    {
      'image': 'assets/images/all_produk/product_list12.jpg',
      'nama': 'Salmon Roll',
      'category': 'Food',
      'rating': '4.8',
      'jarak': '2km',
      'waktu': '8min',
      'harga': 'Rp 50,000',
    },
    {
      'image': 'assets/images/discount_parah/discount_parah3.jpg',
      'nama': 'Pangsit Emas',
      'category': 'Food',
      'rating': '5.0',
      'jarak': '15km',
      'waktu': '35min',
      'harga': 'Rp 20,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: allFood.length,
        itemBuilder: (context, index) {
          final allProduk = allFood[index];
          return GestureDetector(
            onTap: () {
              // diklik pergi kehalaman detail tergantung makanan itu ada discount atau tidak
              if (allProduk.containsKey('discount')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailProductDiscount(productDiskcount: allProduk)),
                );
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: allProduk)));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      allProduk['image'],
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allProduk['nama'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          allProduk['category'],
                          style: CustomText.body.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              allProduk['rating'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              allProduk['jarak'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              allProduk['waktu'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
