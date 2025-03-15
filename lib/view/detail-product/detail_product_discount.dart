import 'package:apk_mobile/view/Checkout/checkout_screen.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailProductDiscount extends StatefulWidget {
  final Map<String, dynamic> productDiskcount;

  const DetailProductDiscount({Key? key, required this.productDiskcount})
      : super(key: key);

  @override
  State<DetailProductDiscount> createState() => _DetailProductDiscountState();
}

class _DetailProductDiscountState extends State<DetailProductDiscount> {
  int jumlahMakanan = 1; //jumlah awal makanan yang dipesan adalah 1
  final _formKey = GlobalKey<FormState>();

  // fungsinya untuk menambahkan jumlah makanan
  void plusMakanan() {
    setState(() {
      jumlahMakanan++;
    });
  }

  // fungsinya untuk mengurangi jumlah makanan
  void minMakanan() {
    if (jumlahMakanan > 1) {
      setState(() {
        jumlahMakanan--;
      });
    }
  }

// menampilkan alert
  void _showCheckAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Konfirmasi Pesanan"),
          content: Text(
              "Apakah anda yakin ingin memesan ${jumlahMakanan} ${widget.productDiskcount['nama']}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                "Batal",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext); // Tutup dialog konfirmasi

                // Tampilkan loading
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext loadingContext) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child: AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              'assets/loading.json',
                              width: 100,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Harap menunggu, pesanan anda sedang diproses!",
                              textAlign: TextAlign.center,
                              style: CustomText.body,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );

                // durasi proses loading menunggu pesanan
                await Future.delayed(const Duration(seconds: 3));

                if (context.mounted) {
                  Navigator.pop(context); // Tutup loading dialog

                  // // Tampilkan top snackbar success
                  // showTopSnackBar(
                  //   Overlay.of(context),
                  //   Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 16, vertical: 15),
                  //     decoration: BoxDecoration(
                  //       color: Colors.green.shade600,
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         const Icon(
                  //           Icons.check_circle,
                  //           color: Colors.white,
                  //         ),
                  //         const SizedBox(width: 12),
                  //         Text(
                  //           "Pesanan Berhasil dibuat!",
                  //           style: CustomText.body.copyWith(
                  //             color: Colors.white,
                  //             decoration: TextDecoration.none,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );

                  // Navigasi ke checkout setelah snackbar muncul
                  await Future.delayed(const Duration(milliseconds: 500));
                  if (context.mounted) {
                    Navigator.of(context)
                        .push(_createRoute(widget.productDiskcount));
                  }
                }
              },
              child: const Text(
                "Ya, Pesan",
                style: TextStyle(color: AppColors.lightBlue),
              ),
            ),
          ],
        );
      },
    );
  }

  Route<void> _createRoute(Map<String, dynamic> product) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CheckoutScreen(
        product: product, //menerima permintaan parameter product
        jumlahMakanan: jumlahMakanan, //teruskan parameter jumlahMakanan
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.elasticIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 550),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.productDiskcount['image'],
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productDiskcount['nama'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.productDiskcount['harga'],
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.productDiskcount['discount'],
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 4),
                        Text(widget.productDiskcount['rating']),
                        const SizedBox(width: 16),
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(widget.productDiskcount['jarak']),
                        const SizedBox(width: 16),
                        const Icon(Icons.timer, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(widget.productDiskcount['waktu']),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Jumlah: ",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: minMakanan,
                            icon: const Icon(Icons.remove_circle_outline),
                            color: AppColors.lightBlue,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              jumlahMakanan.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: plusMakanan,
                            icon: const Icon(Icons.add_circle_outline),
                            color: AppColors.lightBlue,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Deskripsi",
                      style: CustomText.title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis justo vel nunc"
                      "fermentum tincidunt. Integer nec sapien ac turpis hendrerit tempus. Fusce auctor,"
                      "sapien in tincidunt tempus, ex libero accumsan felis, non posuere lorem justo a nunc. "
                      "Aliquam erat volutpat. Aenean bibendum, lacus non pharetra hendrerit, augue justo"
                      "scelerisque ligula, nec cursus dolor mauris sed metus. Mauris sagittis turpis at"
                      "justo fermentum, id congue ex porta. Suspendisse potenti. Duis nec suscipit lorem.",
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showCheckAlert(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4CAF50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shadowColor: Colors.green.withOpacity(0.3)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Checkout",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
