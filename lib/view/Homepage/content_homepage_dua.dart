import 'package:flutter/material.dart';

class ContentHomepageDua extends StatelessWidget {
  ContentHomepageDua({super.key});

  final List<Map<String, String>> produk = [
    {
      'nama': 'Shoyu Ramen',
      'harga': 'Rp. 500.000',
      'gambar': 'assets/images/content2/produk1.jpg',
      'rating': '4.8'
    },
    {
      'nama': 'Sushi Salmon',
      'harga': 'Rp. 2.000.000',
      'gambar': 'assets/images/content2/produk2.jpg',
      'rating': '4.5'
    },
    {
      'nama': 'Capuchino Cincau',
      'harga': 'Rp. 35.000',
      'gambar': 'assets/images/content2/produk3.jpg',
      'rating': '5.0'
    },
    {
      'nama': 'Mie Gacoan Pedes Nampoll',
      'harga': 'Rp. 50.000',
      'gambar': 'assets/images/content2/produk4.jpg',
      'rating': '4.9'
    },
    {
      'nama': 'Coffe Latte',
      'harga': 'Rp. 50.000',
      'gambar': 'assets/images/content2/produk5.jpg',
      'rating': '4.7'
    },
    {
      'nama': 'French Fries',
      'harga': 'Rp. 70.000',
      'gambar': 'assets/images/content2/produk6.jpg',
      'rating': '4.8'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: produk.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            produk[index]['gambar']!,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produk[index]['nama']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    produk[index]['harga']!,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(produk[index]['rating']!)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
