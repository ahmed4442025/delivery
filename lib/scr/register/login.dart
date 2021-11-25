import 'package:delivery15/scr/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class loginScr extends StatefulWidget {
  const loginScr({Key? key}) : super(key: key);

  @override
  _loginScrState createState() => _loginScrState();
}

class _loginScrState extends State<loginScr> {
  //vars
  String bg1Path = "images/bg/istockphoto.png";
  String bg2Path = "images/bg/path 1123.png";
  String logoPath = "images/other/logod.png";
  String descrpt =
      "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.";

  //colors
  Color upBgCl = const Color(0xfff5a831);

  //sizes
  Size upSiz = const Size(260, 45);

  // text Controlers
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  //class
  helpDis help = new helpDis();

  //logo and description
  Container logoAndDescrip() => Container(
        child: Column(
          children: [
            Image.asset(logoPath),
            help.spaces(),
            Text(
              descrpt,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ],
        ),
      );

  // user and password form
  Container userAndPass() => Container(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 40, top: 20),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.17),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            help.textEditWithIcon('date', username, "USERNANE"),
            help.textEditWithIcon('date', password, "****", password: true)
          ],
        ),
      );

  // login and forget password
  Container loginButton() => Container(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            help.buttonWithBorderNosize(
                "Log In", Colors.white, () {}, upBgCl, upBgCl),
            // register and forget
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "forget password !",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      );

  //main Container
  Container mainContainer() => Container(
        height: double.infinity,
        decoration: help.background(bg1Path, 1),
        child: Container(
          decoration: help.background(bg2Path, .5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                help.spaces(hight: 100),
                logoAndDescrip(),
                help.spaces(hight: 35),
                Column(
                  children: [
                    userAndPass(),
                    loginButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContainer(),
    );
  }
}
