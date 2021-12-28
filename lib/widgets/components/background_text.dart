import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';

class BackgroundText extends StatelessWidget {
  const BackgroundText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'COLLECTION 2020',
            style: TextStyle(
              color: yellow,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Frid Gadgets',
            style: TextStyle(
              color: white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
