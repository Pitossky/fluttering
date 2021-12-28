import 'package:ecommerce_app/constants/constants.dart';
import 'package:flutter/material.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: red,
      body: Padding(
        padding: const EdgeInsets.only(
          top: appPadding * 2,
          left: appPadding,
          bottom: appPadding * 3,
        ),
        child: Container(
          width: size.width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.close_rounded,
                color: white,
              ),
              const Text(
                'Hello, \nFerragamo',
                style: TextStyle(
                  color: white,
                  fontSize: 22,
                ),
              ),
              Container(
                height: size.height * 0.4,
                //color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.home_rounded,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.person_rounded,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.local_atm,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Balance',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.shopping_basket_rounded,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.favorite_rounded,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.help,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.settings_rounded,
                          color: yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: white,
                thickness: 0.85,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: yellow,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
