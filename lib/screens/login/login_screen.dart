import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test_application/screens/home/home_screen.dart';
import 'package:flutter_test_application/screens/login/widgets/form_container.dart';
import 'package:flutter_test_application/screens/login/widgets/input_widget.dart';
import 'package:flutter_test_application/stores/login_store.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_test_application/screens/login/widgets/forgot_widget.dart';
import 'package:flutter_test_application/screens/login/widgets/stagger_animation.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  LoginStore loginStore = LoginStore();
  AnimationController _animationController;

  bool _keyboardIsVisible = false;
  bool _switchState = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.copleted) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          return _keyboardIsVisible = visible;
        });
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /* SizedBox(height: 200), */
                      _imageGen(),
                      /* SwitchLogin(), */
                      Column(
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
                              unSelectedTextStyle:
                                  TextStyle(color: Colors.black),
                              width: 60,
                              height: 45,
                              borderRadius: 30,
                            ),
                          ),
                          _formLogin()
                        ],
                      ),
                      ForgotButton(text: "Esqueceu sua senha?")
                    ],
                  ),
                  StaggerAnimation(
                    controller: _animationController.view,
                    validator: loginStore.isFormValid,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _imageGen() => Padding(
        padding: EdgeInsets.only(
            top: _keyboardIsVisible ? 80 : 200,
            bottom: _keyboardIsVisible ? 0 : 32),
        child: Image.asset(
          "images/logo.png",
          width: _keyboardIsVisible ? 70 : 150,
          height: _keyboardIsVisible ? 70 : 150,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      );

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
                  textInputType: TextInputType.emailAddress,
                  onChanged: loginStore.setEmail,
                ),
                InputField(
                  hint: "Senha",
                  obscure: true,
                  icon: Icons.lock,
                  onChanged: loginStore.setPassword,
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

  //HTTP requests

  Future _loginRequest(String request) async {
    String url = 'https://flutter-api-test.herokuapp.com/v1/sessions';
    Map<String, String> headers = {"Content-type": "application/json"};
    //String json = '';

    Response response = await post(url, headers: headers, body: request);

    if (response.statusCode == 200) {
      print(response.body);
      return print(response.body);
    } else {
      return false;
    }
  }
}
