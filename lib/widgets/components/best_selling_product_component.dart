import 'package:ecommerce_app/constants/constants.dart';
import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/models/best_selling_product.dart';
import 'package:ecommerce_app/screens/details_screen.dart';
import 'package:ecommerce_app/widgets/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestSellingProductComponent extends StatelessWidget {
  const BestSellingProductComponent({Key? key}) : super(key: key);

  Widget _buildBestSellingProducts(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    BestSellingProduct bestSellingProducts = bestSellingProductsList[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: appPadding / 2, horizontal: appPadding / 3),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: brown,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                width: size.width * 0.24,
                fit: BoxFit.cover,
                image: AssetImage(bestSellingProducts.imageUrl),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: size.width * 0.24,
              padding: const EdgeInsets.only(top: appPadding / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bestSellingProducts.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bestSellingProducts.description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: white,
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        '\$',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${bestSellingProducts.price}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: white,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //SizedBox(width: 2,),
            Container(
              width: size.width * 0.24,
              padding: const EdgeInsets.only(
                  top: appPadding / 6,
                  right: appPadding / 5,
                  bottom: appPadding / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StarRating(bestSellingProducts.rating),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(
                              products: bestSellingProducts
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width * 0.12,
                        height: size.height * 0.06,
                        decoration: const BoxDecoration(
                          color: red,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: white,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        height: size.height * 0.2,
        width: size.width,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: bestSellingProductsList.length,
          itemBuilder: (context, index) {
            return _buildBestSellingProducts(context, index);
          },
        ),
      ),
    );
  }
}
