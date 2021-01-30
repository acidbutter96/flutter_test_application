import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/home/widgets/content.dart';
import 'package:flutter_test_application/screens/home/widgets/swipe_up.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/background.png"),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter),
        ),
        child: Stack(children: <Widget>[
          Center(
            child: ListView(
              padding: EdgeInsets.only(top: 45, left: 25),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // SizedBox(height: 200),
                    TopBar(),
                    Artists()
                  ],
                ),
              ],
            ),
          ),
          SwipeUp()
        ]),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Image.asset(
        "images/aruja_logo.png",
        width: 90,
        height: 90,
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
      ),
    );
  }
}
