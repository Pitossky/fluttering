import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/models/best_selling_product.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final BestSellingProduct products;
  const ProductImages(this.products);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  Widget _buildImages(
      BuildContext context, int index, List<String> imageUrlList) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: appPadding / 2,
        left: appPadding / 1.5,
        bottom: appPadding / 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(
          width: size.width * 0.45,
          fit: BoxFit.cover,
          image: AssetImage(
            imageUrlList[index],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.products.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.favorite_rounded,
                  color: red,
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.4,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.products.listImagesUrl.length,
              itemBuilder: (context, index) {
                return _buildImages(
                  context,
                  index,
                  widget.products.listImagesUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
