import 'package:flutter/material.dart';

class NaturalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: Image.asset(
              "images/logo.png",
              width: 70,
              height: 70,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
