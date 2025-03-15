import 'package:apk_mobile/view/detail-product/detail_product_discount.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class DiscountProductList extends StatelessWidget {
  DiscountProductList({super.key});

  final List<Map<String, dynamic>> discountProduk = [
    {
      'image': 'assets/images/discount_produk/produk1.jpg',
      'nama': 'Shoyu Ramen',
      'category': 'Food',
      'harga': 'Rp 50,000',
      'discount': 'Rp 35,000',
      'rating': '4.8',
      'jarak': '5km',
      'waktu': '15min'
    },
    {
      'image': 'assets/images/discount_produk/produk2.jpg',
      'nama': 'Mocachino Cincau',
      'category': 'Drinks',
      'harga': 'Rp 25,000',
      'discount': 'Rp 10,000',
      'rating': '4.9',
      'jarak': '3km',
      'waktu': '10min'
    },
    {
      'image': 'assets/images/discount_produk/produk3.jpg',
      'nama': 'Mie Gacoan',
      'category': 'Deserts',
      'harga': 'Rp 15,000',
      'discount': 'Rp 5,000',
      'rating': '4.8',
      'jarak': '10km',
      'waktu': '30min'
    },
    {
      'image': 'assets/images/discount_produk/produk4.jpg',
      'nama': 'Kentang Goreng',
      'category': 'Snacks',
      'harga': 'Rp 45,000',
      'discount': 'Rp 30,000',
      'rating': '4.9',
      'jarak': '8km',
      'waktu': '25min'
    },
    {
      'image': 'assets/images/discount_produk/produk5.jpg',
      'nama': 'Oreo Cheesecake',
      'category': 'Deserts',
      'harga': 'Rp 38,000',
      'discount': 'Rp 21,000',
      'rating': '4.8',
      'jarak': '10km',
      'waktu': '30min'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: discountProduk.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProductDiscount(
                      productDiskcount: discountProduk[index]),
                ),
              );
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
              width: 170,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      discountProduk[index]['image'],
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.lightBlue.withOpacity(0.1)),
                          child: const Text(
                            'Discount 15%',
                            style: TextStyle(
                              color: AppColors.lightBlue,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          discountProduk[index]['nama'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          discountProduk[index]['category'],
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
                              discountProduk[index]['rating'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              discountProduk[index]['jarak'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              discountProduk[index]['waktu'],
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
