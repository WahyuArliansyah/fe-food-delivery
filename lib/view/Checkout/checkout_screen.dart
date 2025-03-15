import 'package:apk_mobile/view/Checkout/content_checkout.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  // Terima product sebagai parameter
  final Map<String, dynamic> product;

  const CheckoutScreen({
    required this.product,
    int jumlahMakanan = 0,
    super.key,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        title: Text(
          "Keranjang Saya",
          style: CustomText.title.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContentCheckout(
                        product: [widget.product],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
