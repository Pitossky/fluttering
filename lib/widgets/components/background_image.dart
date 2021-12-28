import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Image(
        height: size.height * 0.55,
        fit: BoxFit.cover,
        image: const AssetImage('assets/images/headmain.jpg'),
      ),
    );
  }
}
