import 'package:flutter/material.dart';
import './foods.dart';

class ImageManager extends StatefulWidget {
  final String firstProduct;
  ImageManager(this.firstProduct);

  @override
  State<StatefulWidget> createState() {
    return _ImageManagerState();
  }
}

class _ImageManagerState extends State<ImageManager> {
  List<String> _foods = [];

  @override
  void initState() {
    _foods.add(widget.firstProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _foods.add('Advanced Food Tester');
              });
            },
            child: Text('Add image to List')),
      ),
      Foods(_foods)
    ]);
  }
}
