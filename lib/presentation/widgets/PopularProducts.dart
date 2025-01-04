
import 'package:flutter/material.dart';
import 'package:my_flutter_app/data/models/product.dart';
import 'package:my_flutter_app/generated/l10n.dart';
import 'package:my_flutter_app/presentation/widgets/ProductCard.dart';
import 'package:my_flutter_app/presentation/widgets/SectionTitle.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: S.of(context).PopularProducts,
            press: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: demoProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: demoProducts[index],
                onPress: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
