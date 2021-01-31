import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //reação
  _LoginStore() {
    autorun((_) {
      /* print(email);
      print(password); */
      /* print(isFormValid); */
    });
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  //operations envolving observables and returning a third observable

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @observable
  bool loading = true;

  @action
  Future login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 10));
    loading = false;
  }

  Future<Map> fetchLogin({String mail, String pass}) async {
    http.Response response = await http.post(
      "https://flutter-api-test.herokuapp.com/v1/sessions",
      body: {'email': mail, 'password': pass},
    );
    print(json.decode(response.body));
  }
}
