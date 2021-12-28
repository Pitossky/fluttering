import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/widgets/components/drawer_body.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Duration animationDuration = const Duration(milliseconds: 500);
  late Animation<double> scaleAnimation;
  bool drawerOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const DrawerBody(),
          AnimatedPositioned(
            duration: animationDuration,
            top: 0,
            bottom: 0,
            left: drawerOpen ? size.width * 0.55 : 0.0,
            right: drawerOpen ? size.width * -0.45 : 0.0,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: GestureDetector(
                onTap: () {
                  if (drawerOpen) {
                    setState(() {
                      drawerOpen = false;
                      _animationController.reverse();
                    });
                  }
                },
                child: AbsorbPointer(
                  absorbing: drawerOpen,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      drawerOpen ? 50.0 : 0.0,
                    ),
                    child: HomeScreen(
                      drawerFunction: () {
                        setState(() {
                          drawerOpen = true;
                          _animationController.forward();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
