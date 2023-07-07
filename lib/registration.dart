import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Edit_task.dart';
import 'My_task.dart';
import 'home_page.dart';
import 'login.dart';
// import 'package:fruit_2/product_page.dart';

// import 'login_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegistrationScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            // color: Colors.green[200],
            // width: MediaQuery.of(context).size.width,
            // padding: const EdgeInsets.only(top: 100, right: 100, left: 100),
            // margin: const EdgeInsets.only(left: 100),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 100,
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                      elevation: 0,
                      color: Colors.green[500],
                      child: SizedBox(
                        width: 380,
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyHomePage()));
                                    },
                                    child: const Text(
                                      "TODO",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Email',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ), //Textstyle
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,

                                          autofocus: false,
                                          // ignore: prefer_const_constructors
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                              // borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            labelStyle: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Colors.white),
                                            suffixIcon: const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 2.0),
                                              child: Icon(
                                                Icons.email,
                                                color: Colors.white,
                                              ), // Change this icon as per your requirement
                                            ),
                                            labelText: 'Enter Email',
                                          ),
                                          // validator: Validation().text,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        child: Text(
                                          'Password',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ), //Textstyle
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,

                                          autofocus: false,
                                          // ignore: prefer_const_constructors
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                              // borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            labelStyle: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Colors.white),
                                            suffixIcon: const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 2.0),
                                              child: Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.white,
                                              ), // Change this icon as per your requirement
                                            ),
                                            labelText: 'Enter Password',
                                          ),
                                          // validator: Validation().text,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10, top: 20),
                                        child: Text(
                                          'Confirm Password',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ), //Textstyle
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,

                                          autofocus: false,
                                          // ignore: prefer_const_constructors
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                              // borderRadius: BorderRadius.circular(25.0),
                                            ),
                                            labelStyle: const TextStyle(
                                                letterSpacing: 0.1,
                                                color: Colors.white),
                                            suffixIcon: const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 2.0),
                                              child: Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.white,
                                              ), // Change this icon as per your requirement
                                            ),
                                            labelText:
                                                'Enter Confirm Password ',
                                          ),
                                          // validator: Validation().text,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ), //Column
                        ), //Padding
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[500],
                                  padding: const EdgeInsets.all(
                                      10.0) // Background color
                                  ),
                              child: Text(
                                'Registration',
                              ),
                              onPressed: () {
                                print('Hello');
                              },
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 50,
                      ),
                      Icon(
                        FontAwesomeIcons.google,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Do you have an account? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'Log In',
                        style: const TextStyle(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          }),
                  ])),
                ),
              ],
            ),
          )),
    );
  }
}
