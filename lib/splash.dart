import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irmdesks/Constant/color.dart';
import 'package:irmdesks/Home.dart';
import 'package:irmdesks/load.dart';
import 'package:irmdesks/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      SharedPreferences session = await SharedPreferences.getInstance();
      var status = session.getString('status');
      // var mobile = session.getString('phone');
      // var token = session.getString('token');
      print("-------");
      print(status);
      if (status == '1') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Load()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Loginpage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/svlogo.png',
                height: 100,
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
