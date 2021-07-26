import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/components/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? myController;
  Animation? myAnimation;

  @override
  void initState() {
    super.initState();

    myController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    myAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(myController!);
    myController!.forward();
    myController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAnimation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ["Let's Chat"],
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              buttonColour: Colors.lightBlueAccent,
              buttonTitle: 'Log In',
            ),
            RoundButton(
              buttonColour: Colors.blueAccent,
              buttonTitle: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}


