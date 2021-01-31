import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final bool validator;
  final bool loginstatus;

  StaggerAnimation({this.controller, this.validator, this.loginstatus})
      : buttonSqueeze = Tween<double>(begin: 190, end: 45).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = Tween<double>(begin: 45.0, end: 1000).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.bounceInOut),
          ),
        ),
        buttonColor = ColorTween(
                begin: Colors.black, end: Color.fromRGBO(103, 64, 243, 1))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.easeIn),
          ),
        );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;
  final Animation<Color> buttonColor;

  Widget _buildAnimation(BuildContext context, Widget child) {
    //timeDilation = 4;
    return Padding(
      padding: EdgeInsets.only(bottom: 35),
      child: InkWell(
        onTap: () async {
          controller.forward();
          await Future.delayed(Duration(milliseconds: 300));
          while (loginstatus) {
            controller.stop();
          }
        },
        child: Hero(
          tag: "fade",
          child: buttonZoomOut.value <= 45
              ? Container(
                  width: buttonSqueeze.value,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        validator ? Colors.black : Color.fromRGBO(0, 0, 0, .5),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: _buildInside(context),
                )
              : Container(
                  width: buttonZoomOut.value,
                  height: buttonZoomOut.value,
                  decoration: BoxDecoration(
                    color: buttonColor.value,
                    shape: buttonZoomOut.value < 400
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 60) {
      return Text(
        "Entrar Agora!",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
