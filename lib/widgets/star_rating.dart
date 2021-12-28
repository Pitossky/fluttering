import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  //const StarRating({Key? key, this.rating}) : super(key: key);

  final double rating;

  const StarRating(this.rating);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {

  Widget star(bool fill){
    return Icon(
      Icons.star,
      size: 18,
      color: fill ? yellow : white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          if (index < (widget.rating).round()) {
            return star(true);
          } else {
            return star(false);
          }
        },
      ),
    );
  }
}
