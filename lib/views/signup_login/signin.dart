import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wota/views/pages/home_page.dart';
import 'package:wota/views/signup_login/signup.dart';

import '../../services/api.dart';
import '../../widgets/text_widget.dart';
import '../pages/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email': emailController.text,
      'password': textController.text,
    };

    var res = await CallApi().postData(data, 'auth/login');
    var body = json.decode(res.body);
    // ignore: avoid_print
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      //TODO After Login send the user to the Tank list screen with getx

      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Home()));
    } else {
      _showMsg(body['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                Container(
                  padding: const EdgeInsets.only(left: 0, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.arrow_back_ios,
                              color: const Color.fromARGB(255, 25, 116, 190)),
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pop(context))
                    ],
                  ),
                ),
                SizedBox(height: height * 0.1),
                TextWidget(
                  text: "Here to Get",
                  fontSize: 26,
                  isUnderLine: false,
                  key: null,
                ),
                TextWidget(
                  text: "Welcomed !",
                  fontSize: 26,
                  isUnderLine: false,
                  key: null,
                ),
                SizedBox(height: height * 0.1),
                TextInput(
                    textString: "Email",
                    textController: emailController,
                    hint: "Email"),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  textString: "Password",
                  textController: textController,
                  hint: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Sign in",
                      fontSize: 22,
                      isUnderLine: false,
                      key: null,
                    ),
                    GestureDetector(
                        onTap: () {
                          _login();
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF363f93),
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white, size: 30),
                        ))
                  ],
                ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: TextWidget(
                        text: "Sign up",
                        fontSize: 16,
                        isUnderLine: true,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class TextInput extends StatelessWidget {
  final String textString;
  TextEditingController textController;
  final String hint;
  bool obscureText;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.hint,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: const Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.textString,
        hintStyle: const TextStyle(
            color: const Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
