import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/home/widgets/swipe_up_natural.dart';
import 'package:flutter_test_application/screens/home/widgets/swipe_up_opened.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SwipeUp extends StatefulWidget {
  @override
  _SwipeUpState createState() => _SwipeUpState();
}

class _SwipeUpState extends State<SwipeUp> {
  double _changeStatusOpened = 0;
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: 670,
      color: _changeStatusOpened < .5
          ? Color.fromRGBO(103, 64, 243, 1)
          : Colors.white,
      panel: Container(
        margin: EdgeInsets.only(top: 45),
        child: SwipeUpOpened(),
      ),
      margin: _changeStatusOpened > .9
          ? EdgeInsets.only(left: 10, right: 10)
          : EdgeInsets.only(left: 0, right: 0),
      onPanelSlide: (slided) {
        setState(() {
          _changeStatusOpened = slided;
        });
        print(slided);
      },
      collapsed: NaturalBar(),
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(40), topLeft: Radius.circular(40)),
    );
  }
}
