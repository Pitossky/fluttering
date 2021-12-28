import 'package:ecommerce_app/widgets/components/background_image.dart';
import 'package:ecommerce_app/widgets/components/background_text.dart';
import 'package:ecommerce_app/widgets/components/bottom_container.dart';
import 'package:ecommerce_app/widgets/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final VoidCallback drawerFunction;
  HomeScreen({required this.drawerFunction});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(widget.drawerFunction),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BackgroundText(),
                  BottomContainer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
