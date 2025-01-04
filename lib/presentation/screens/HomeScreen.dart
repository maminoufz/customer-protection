import 'package:flutter/material.dart';
import 'package:my_flutter_app/presentation/screens/productdetailScreen.dart';
import 'package:my_flutter_app/presentation/widgets/DiscountBanner.dart';
import 'package:my_flutter_app/presentation/widgets/IconBtnWithCounter.dart';
import 'package:my_flutter_app/presentation/widgets/PopularProducts.dart';
import 'package:my_flutter_app/presentation/widgets/SearchField.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              PopularProducts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            icon: Icons.qr_code_scanner,
            press: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleBarcodeScannerPage(),
                ),
              );
              if (result != null) {
                // Navigate to the ProductDetailScreen with the scanned result
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(barcodeResult: result),
                  ),
                );
              }
            },
          ),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            icon: Icons.notifications,
            numOfitem: 0,
            press: () {},
          ),
        ],
      ),
    );
  }
}
