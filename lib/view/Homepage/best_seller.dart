import 'package:apk_mobile/view/detail-product/detail_product_nondiscount.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  BestSeller({super.key});

  final List<Map<String, dynamic>> sellerProduct = [
    {
      'image': 'assets/images/discount_parah/discount_parah1.jpg',
      'nama': 'Pop Ice',
      'category': 'Drinks',
      'harga': 'Rp 12,000',
      'rating': '4.8',
      'jarak': '5km',
      'waktu': '15min'
    },
    {
      'image': 'assets/images/discount_parah/discount_parah2.jpg',
      'nama': 'Coffe Boba',
      'category': 'Drinks',
      'harga': 'Rp 15,000',
      'rating': '4.8',
      'jarak': '3km',
      'waktu': '10min'
    },
    {
      'image': 'assets/images/discount_parah/discount_parah3.jpg',
      'nama': 'Pangsit Emas',
      'category': 'Snacks',
      'harga': 'Rp 20,000',
      'rating': '5.0',
      'jarak': '15km',
      'waktu': '35min'
    },
    {
      'image': 'assets/images/discount_parah/discount_parah4.jpg',
      'nama': 'Chocolate Cake',
      'category': 'Dessert',
      'harga': 'Rp 25,000',
      'rating': '4.9',
      'jarak': '5km',
      'waktu': '15min'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sellerProduct.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                            product: sellerProduct[index],
                          )));
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
                      sellerProduct[index]['image'],
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
                        Text(
                          sellerProduct[index]['nama'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          sellerProduct[index]['category'],
                          style: CustomText.body.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              sellerProduct[index]['rating'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              sellerProduct[index]['jarak'],
                              style: CustomText.body.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              sellerProduct[index]['waktu'],
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
