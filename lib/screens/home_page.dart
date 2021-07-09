import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/utils/nav_prompt_button.dart';
import 'package:portfolio_app/utils/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double layerOne = 200;
  double layerTwo = 350;
  double layerThree = 300;
  double layerFour = 350;
  double layerFive = 300;
  double layerSix = 200;
  double layerSeven = 00;

  double scale = 10;
  double heightScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Transform.scale(
                scale: 1.8,
                child: const Image(image: AssetImage('assets/1.png'))),
          ),
          Positioned(
            top: layerTwo,
            child: const Image(image: AssetImage('assets/2.png')),
          ),
          Positioned(
            top: layerThree,
            left: 100,
            child: const Image(image: AssetImage('assets/3.png')),
          ),
          Positioned(
            top: layerFour,
            right: -32,
            child: const Image(image: AssetImage('assets/4.png')),
          ),
          Positioned(
            top: layerFive,
            right: -30 + layerOne / 20,
            child: const Image(image: AssetImage('assets/5.png')),
          ),
          Positioned(
            top: layerSix,
            left: 100,
            child: const Image(image: AssetImage('assets/6.png')),
          ),
          Positioned(
            top: layerFour - 300,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi. \nWelcome to this App.\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const Text(
                  "I'm Suramya. I'm a",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'GameDev.',
                      textStyle: kAnimatedTextStyle,
                    ),
                    TyperAnimatedText(
                      'Pixel Artist.',
                      textStyle: kAnimatedTextStyle,
                    ),
                    TyperAnimatedText(
                      'Developer.',
                      textStyle: kAnimatedTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 400),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 70,
                  child: const Text(
                    'This app is a project made in Flutter. This app integrates functionalities such as Firebase, File Management, Authentication, BLoC state management and animated UI. To learn more, check it out on Github:  ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green.shade700,
                  ),
                  height: 50,
                  width: 100,
                  child: Row(
                    children: const [
                      Icon(Icons.code, color: Colors.white),
                      Text(
                        'Github',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          ListView(
            children: [
              GestureDetector(
                onVerticalDragUpdate: (value) {
                  setState(() {
                    heightScore -= value.delta.dy;
                    if (heightScore < -90) heightScore = -90;
                    if (heightScore > 90) heightScore = 90;

                    if (heightScore >= -80 && heightScore < 85) {
                      layerOne += value.delta.dy / 1 * scale;
                      layerTwo += value.delta.dy / 2 * scale;
                      layerThree += value.delta.dy / 3 * scale;
                      layerFour += value.delta.dy / 4 * scale;
                      layerFive += value.delta.dy / 5 * scale;
                      layerSix += value.delta.dy / 5 * scale;
                      layerSeven += value.delta.dy / 2 * scale;
                    }
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  height: 650,
                ),
              ),
            ],
          ),
          const NavPromptButton(),
        ],
      ),
    );
  }
}
