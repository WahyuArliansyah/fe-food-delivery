import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class CategoryProduk extends StatelessWidget {
  CategoryProduk({super.key});

  final categori = ['Food', 'Drinks', 'Snacks', 'Dessert'];
  final icons = [
    Icons.restaurant,
    Icons.local_drink,
    Icons.bakery_dining,
    Icons.cake,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categori.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icons[index],
                    size: 32,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    categori[index],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
