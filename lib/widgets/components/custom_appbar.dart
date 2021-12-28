import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {

  final VoidCallback drawerFunction;
  CustomAppBar(this.drawerFunction);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
              onTap: widget.drawerFunction,
              child: const Icon(
                Icons.short_text_rounded,
                color: white,
                size: 25,
              ),
            ),
            Text(
              "Frid.com",
              style: TextStyle(
                color: yellow,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.search_rounded,
              color: white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
