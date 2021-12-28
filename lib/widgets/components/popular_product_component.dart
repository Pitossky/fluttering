import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/models/popular_product.dart';
import 'package:flutter/material.dart';

class PopularProductComponent extends StatelessWidget {
  const PopularProductComponent({Key? key}) : super(key: key);

  Widget _buildPopularProducts(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    PopularProduct popularProducts = popularProductsList[index];

    return Container(
      width: size.width * 0.3,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: appPadding / 4),
            child: Container(
              width: size.width * 0.2,
              height: size.height * 0.09,
              decoration: BoxDecoration(
                color: brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: appPadding / 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${popularProducts.price}',
                      style: const TextStyle(
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '\$${popularProducts.oldPrice}',
                      style: const TextStyle(
                        color: yellow,
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.005,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: appPadding / 4),
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.4),
                      offset: const Offset(5, 5),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(popularProducts.imageUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: popularProductsList.length,
        itemBuilder: (context, index) {
          return _buildPopularProducts(context, index);
        },
      ),
    );
  }
}
