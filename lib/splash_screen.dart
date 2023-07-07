import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/registration.dart';

import 'database_repo/database_repository.dart';
// import 'package:fruit_2/product_page.dart';

// import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initDb();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegistrationScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "To Do App",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  void initDb() async {
    await DatabaseRepository.instance.todoDatabase;
  }
}
