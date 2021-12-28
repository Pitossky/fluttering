import 'package:ecommerce_app/models/best_selling_product.dart';
import 'package:ecommerce_app/widgets/components/details_appbar.dart';
import 'package:ecommerce_app/widgets/components/product_details.dart';
import 'package:ecommerce_app/widgets/components/product_images.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {

  final BestSellingProduct products;

  const DetailsScreen({required this.products});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DetailsAppBar(),
          ProductImages(widget.products),
          ProductDetails(widget.products),
        ],
      ),
    );
  }
}
