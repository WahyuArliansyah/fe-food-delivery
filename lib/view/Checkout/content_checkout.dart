import 'package:apk_mobile/view/OrdetList/order_screen.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ContentCheckout extends StatefulWidget {
  const ContentCheckout({required this.product, super.key});
  final List<Map<String, dynamic>> product;

  @override
  State<ContentCheckout> createState() => _ContentCheckoutState();
}

class _ContentCheckoutState extends State<ContentCheckout> {
  final List<Map<String, dynamic>> contentCheckout = [
    {
      'status': 'Dikemas',
      'image': 'assets/images/all_produk/product_list2.jpg',
      'nama': 'Coffe Boba',
      'harga': 'Rp 15,000',
      'kurir': 'Wahyu Arliansyah',
      'category': 'Drinks',
      'totalBarang': '2x',
      'subtotalProduk': 'Rp30.000',
      'ongkir': 'Rp4.500',
      'totalBayar': 'Rp34.500',
      'selectedPayment': null
    },
    {
      'status': 'Dikirim',
      'image': 'assets/images/all_produk/product_list4.jpg',
      'nama': 'Kentang Goreng',
      'harga': 'Rp 30,000',
      'kurir': 'Jaenuddin',
      'category': 'Drinks',
      'totalBarang': '2x',
      'subtotalProduk': 'Rp60.000',
      'ongkir': 'Rp4.000',
      'totalBayar': 'Rp64.000',
      'selectedPayment': null
    },
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {'name': 'BCA', 'image': 'assets/images/pembayaran/bca-1.jpg'},
    {'name': 'Mandiri', 'image': 'assets/images/pembayaran/mandiri.jpg'},
    {'name': 'BNI', 'image': 'assets/images/pembayaran/bni.jpg'},
    {'name': 'BRI', 'image': 'assets/images/pembayaran/bri.jpg'},
    {'name': 'Dana', 'image': 'assets/images/pembayaran/dana.jpg'},
    {'name': 'GoPay', 'image': 'assets/images/pembayaran/goPay.jpg'},
    {'name': 'OVO', 'image': 'assets/images/pembayaran/ovo.jpg'},
    {'name': 'COD', 'image': 'assets/images/pembayaran/cod.png'},
  ];

  // String? selectedPaymentMethod;
  void selectPaymentMethod(int checkoutIndex, String methodName) {
    setState(() {
      contentCheckout[checkoutIndex]['selectedPayment'] = methodName;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: contentCheckout.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.black,
                      width: 0.4,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bagian product
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  contentCheckout[index]['image'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contentCheckout[index]['nama'],
                                    style: CustomText.body.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  Text(contentCheckout[index]['category'],
                                      style: CustomText.body),
                                  Text(contentCheckout[index]['totalBarang'],
                                      style: CustomText.body),
                                  const SizedBox(height: 5),
                                  Text(
                                    contentCheckout[index]['harga'],
                                    style: CustomText.body
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Payment Detail
                          Text('Rincian Pembayaran', style: CustomText.title),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildPaymentDetailRow(
                                  "Subtotal untuk makanan",
                                  contentCheckout[index]['subtotalProduk'],
                                ),
                                const SizedBox(height: 10),
                                buildPaymentDetailRow(
                                  "Subtotal Pengiriman",
                                  contentCheckout[index]['ongkir'],
                                ),
                                const SizedBox(height: 10),
                                buildPaymentDetailRow(
                                  "Total Pembayaran",
                                  contentCheckout[index]['totalBayar'],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Payment method
                          Text('Metode Pembayaran', style: CustomText.title),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[400]!),
                            ),
                            child: Column(
                              children: [
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 10,
                                  children: paymentMethods.map((method) {
                                    bool isSelected = contentCheckout[index]
                                            ['selectedPayment'] ==
                                        method['name'];
                                    return GestureDetector(
                                      onTap: () => selectPaymentMethod(
                                          index, method['name']),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.blue[50]
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.grey[300]!,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              method['image'],
                                              width: 30,
                                              height: 20,
                                              fit: BoxFit.contain,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              method['name'],
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.blue
                                                    : Colors.black87,
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Button chekcout
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF4CAF50),
                                        Color(0xFF45A049)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        // Fungsi akan ditambahkan nanti
                                        if (_formKey.currentState!.validate()) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Lottie.asset(
                                                          'assets/loading.json',
                                                          width: 100,
                                                          height: 100,
                                                        ),
                                                        const SizedBox(
                                                            height: 16),
                                                        Text(
                                                          'Pesanan Sedang Di Proses!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              CustomText.body,
                                                        )
                                                      ],
                                                    ),
                                                  ));

                                          // proses loading
                                          await Future.delayed(
                                              const Duration(seconds: 3));

                                          if (context.mounted) {
                                            Navigator.pop(
                                                context); // Tutup loading dialog

                                            // Tampilkan top snackbar success
                                            showTopSnackBar(
                                              Overlay.of(context),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade600,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.check_circle,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Text(
                                                      "Pesanan Berhasil dibuat!",
                                                      style: CustomText.body
                                                          .copyWith(
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );

                                            // Navigasi ke checkout setelah snackbar muncul
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                            if (context.mounted) {
                                              Navigator.of(context)
                                                  .push(_createRoute());
                                            }
                                          }
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.shopping_cart_checkout,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              'Checkout Sekarang',
                                              style: CustomText.title.copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildPaymentDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(value, style: CustomText.body.copyWith(fontSize: 14)),
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const OrderScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.elasticIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 550),
  );
}
