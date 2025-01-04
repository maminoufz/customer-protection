import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/scheduler.dart'; // Import SchedulerBinding

class ProductDetailScreen extends StatefulWidget {
  final String barcodeResult;

  const ProductDetailScreen({Key? key, required this.barcodeResult}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<Map<String, dynamic>> productDetails;

  @override
  void initState() {
    super.initState();
    productDetails = _fetchProductDetails();
  }

  Future<Map<String, dynamic>> _fetchProductDetails() async {
    final url = Uri.parse('https://world.openfoodfacts.org/api/v3/product/${widget.barcodeResult}.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['product'] != null) {
        return data['product'];
      } else {
        throw Exception("Product not found");
      }
    } else {
      throw Exception("Failed to load product details");
    }
  }

  void _checkSugarContent(BuildContext context, Map<String, dynamic> product) {
    final sugarContent = product['nutriments']?['sugars_100g'];
    if (sugarContent != null) {
      final double sugar = double.tryParse(sugarContent.toString()) ?? 0.0;
      if (sugar > 22) {
        // Schedule the SnackBar after the build phase
        SchedulerBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Warning: This product has high sugar content!")),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: productDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final product = snapshot.data!;

          // Check sugar content here
          _checkSugarContent(context, product);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product['product_name'] ?? 'Unknown Product',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildImage(product),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      children: [
                        Chip(label: Text('Brand: ${product['brands'] ?? 'Unknown'}')),
                        Chip(label: Text('Category: ${product['categories'] ?? 'Unknown'}')),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text('Nutritional Info',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    _buildNutritionalTable(context, product),
                    const SizedBox(height: 24),
                    _buildIngredients(product),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success message")));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 39, 215, 86),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text('Show Success Message', style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(Map<String, dynamic> product) {
    if (product['image_url'] != null) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(product['image_url'], height: 200, fit: BoxFit.cover),
        ),
      );
    } else {
      return Center(child: Text("No image available"));
    }
  }

  Widget _buildNutritionalTable(BuildContext context, Map<String, dynamic> product) {
    return DataTable(
      columnSpacing: 16,
      horizontalMargin: 0,
      border: TableBorder.all(),
      columns: [
        DataColumn(label: Text('Nutrient', style: const TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Amount', style: const TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: [
        _buildDataRow(context, product, 'energy-kcal', 'Energy', 'kcal'),
        _buildDataRow(context, product, 'fat', 'Fat', 'g'),
        _buildDataRow(context, product, 'saturated-fat', 'Saturated Fat', 'g'),
        _buildDataRow(context, product, 'carbohydrates', 'Carbohydrates', 'g'),
        _buildDataRow(context, product, 'sugars', 'Sugars', 'g'),
        _buildDataRow(context, product, 'proteins', 'Proteins', 'g'),
        _buildDataRow(context, product, 'salt', 'Salt', 'g'),
      ],
    );
  }

  DataRow _buildDataRow(BuildContext context, Map<String, dynamic> product, String nutrientKey, String nutrientLabel, String unit) {
    return DataRow(cells: [
      DataCell(Text(nutrientLabel)),
      DataCell(Text('${product['nutriments'][nutrientKey] ?? 'Not available'} $unit')),
    ]);
  }

  Widget _buildIngredients(Map<String, dynamic> product) {
    final ingredientsText = product['ingredients_text'] ?? 'Ingredients not available';
    final ingredientsImage = product['ingredients_image_url'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ingredientsImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(ingredientsImage, height: 200, fit: BoxFit.cover),
              )
            : Text(ingredientsText),
      ],
    );
  }
}
