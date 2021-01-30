import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/login/widgets/input_widget.dart';
/* import 'package:flutter_test_application/screens/login/widgets/switch_login.dart'; */

import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

/* class SwitchLogin extends StatefulWidget {
  @override
  _SwitchLoginState createState() => _SwitchLoginState();
}

class _SwitchLoginState extends State<SwitchLogin> {
  bool _switchState;

  @override
  Widget build(BuildContext context) {
    return ;
  }
} */

class SwitcherForm extends StatefulWidget {
  @override
  _SwitcherFormState createState() => _SwitcherFormState();
}

class _SwitcherFormState extends State<SwitcherForm> {
  bool _switchState = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: FlutterToggleTab(
            labels: ["Entre", "Cadastre-se"],
            initialIndex: 0,
            selectedLabelIndex: (index) {
              setState(() {
                if (index == 0) {
                  this._switchState = true;
                } else {
                  this._switchState = false;
                }
              });
            },
            selectedBackgroundColors: [Colors.black],
            unSelectedBackgroundColors: [Colors.white],
            selectedTextStyle: TextStyle(color: Colors.white),
            unSelectedTextStyle: TextStyle(color: Colors.black),
            width: 60,
            height: 45,
            borderRadius: 30,
          ),
        ),
        _formLogin()
      ],
    );
  }

  Widget _formLogin() => AnimatedCrossFade(
        firstChild: Container(
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: Form(
            child: Column(
              children: [
                InputField(
                  hint: "E-mail",
                  obscure: false,
                  icon: Icons.email_outlined,
                ),
                InputField(
                  hint: "Senha",
                  obscure: true,
                  icon: Icons.lock,
                ),
              ],
            ),
          ),
        ),
        secondChild: Container(
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: Form(
            child: Column(
              children: [
                InputField(
                  hint: "Usuário",
                  obscure: true,
                  icon: Icons.person,
                ),
                InputField(
                  hint: "E-mail",
                  obscure: false,
                  icon: Icons.email_outlined,
                ),
                InputField(
                  hint: "Senha",
                  obscure: true,
                  icon: Icons.lock,
                ),
              ],
            ),
          ),
        ),
        crossFadeState:
            _switchState ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 500),
      );
}
