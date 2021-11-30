import 'package:delivery15/scr/register/forget_password_code_scr.dart';
import 'package:delivery15/scr/register/forget_password_src.dart';
import 'package:delivery15/scr/register/home_scr.dart';
import 'package:delivery15/scr/register/login.dart';
import 'package:delivery15/scr/register/new_password.dart';
import 'package:delivery15/scr/register/register_scr.dart';
import 'package:delivery15/scr/track_and_tasks/cotact_us.dart';
import 'package:delivery15/scr/track_and_tasks/test_path.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home scr class
      home: contactUs(),
    );
  }
}

