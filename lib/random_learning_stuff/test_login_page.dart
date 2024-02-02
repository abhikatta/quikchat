// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quikchat/components/my_input.dart';
import 'package:quikchat/components/square_tile.dart';
// import 'package:quikchat/pages/test_screen.dart';

class TestLoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  TestLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100,
              ),
              Text(
                'Welcome back! Login to continue.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(40, 20, 60, 0.5),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MyInput(
                  inputController: usernameController,
                  obscureText: false,
                  hintText: 'Username'),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              MyInput(
                  inputController: passwordController,
                  obscureText: true,
                  hintText: 'Password'),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                  ),
                  Text('Show Password'),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(25),

                child: Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // onPressed: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => TestScreen()));
                // }
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Register Now! ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      )
                    ],
                  ),
                  Divider(height: 10),
                  Text(
                    'Or continue with ',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SquareTile(
                      imagePath: 'lib/assets/apple-120.png',
                      width: 50,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SquareTile(
                      imagePath: 'lib/assets/google-144.png',
                      width: 50,
                    ),
                  ]),
                ],
              )
            ],
          ),
        )));
  }
}
