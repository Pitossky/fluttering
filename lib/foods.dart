import 'package:flutter/material.dart';

class Foods extends StatelessWidget {
  final List<String> foods;

  Foods(this.foods);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: foods
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/cropped-pancakes.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
