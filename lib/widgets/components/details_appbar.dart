import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height * 0.1,
        //color: white,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: black,
                size: 25,
              ),
            ),
            const Text(
              "Frid.com",
              style: TextStyle(
                color: yellow,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.search_rounded,
              color: black,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
