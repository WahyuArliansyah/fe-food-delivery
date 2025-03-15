import 'package:apk_mobile/view/detail-product/detail_product_nondiscount.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class NewProductList extends StatelessWidget {
  NewProductList({super.key});

  final List<Map<String, dynamic>> newProduk = [
    {
      'image': 'assets/images/new_produk/new_produk1.jpg',
      'nama': 'Salmon Roll',
      'categori': 'Food',
      'harga': 'Rp 50,000',
      'rating': '4.8',
      'jarak': '2km',
      'waktu': '8min'
    },
    {
      'image': 'assets/images/new_produk/new_produk2.jpg',
      'nama': 'Coffe Latte',
      'categori': 'Drinks',
      'harga': 'Rp 45,000',
      'rating': '4.8',
      'jarak': '3km',
      'waktu': '10min'
    },
    {
      'image': 'assets/images/new_produk/new_produk3.jpg',
      'nama': 'Humburger',
      'categori': 'Food',
      'harga': 'Rp 35,000',
      'rating': '4.7',
      'jarak': '3km',
      'waktu': '10min'
    },
    {
      'image': 'assets/images/new_produk/new_produk4.jpg',
      'nama': 'Brownie Sundae',
      'categori': 'Dessert',
      'harga': 'Rp 25,000',
      'rating': '4.8',
      'jarak': '4km',
      'waktu': '12min'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newProduk.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: newProduk[index],
                  ),
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
                      newProduk[index]['image'],
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
                            'New',
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
                          newProduk[index]['nama'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          newProduk[index]['categori'],
                          style: CustomText.body.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              newProduk[index]['rating'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              newProduk[index]['jarak'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              newProduk[index]['waktu'],
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
