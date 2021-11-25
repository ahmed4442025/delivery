import 'package:delivery15/scr/help.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScr extends StatefulWidget {
  const homeScr({Key? key}) : super(key: key);

  @override
  _homeScrState createState() => _homeScrState();
}

class _homeScrState extends State<homeScr> {
  //vars
  String bg1Path = "images/bg/istockphoto.png";
  String bg2Path = "images/bg/path 1123.png";
  String logoPath = "images/other/logod.png";

  //colors
  Color enBgCol = Color(0xff115056);
  Color enBrCol = Color(0xfff5a831);
  Color white = Colors.white;
  Color arTxtCol = Color(0xff707070);
  Color upBgCl = Color(0xfff5a831);
  Color upBrCl = Color(0xffeb1b2f);
  //sizes
  Size enSiz = Size(119, 36);
  Size upSiz = Size(260, 45);

  //class
  helpDis help = new helpDis();

  // language
  Row lang() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          help.buttonWithBorder(
              'English', white, () {}, enBgCol, enBrCol, enSiz),
          help.buttonWithBorder(
              'عربي', arTxtCol, () {},white, enBgCol, enSiz),
        ],
      );
  // language and sign up
  Container langAndSignup(){
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          lang(),
          Container(height: 45,),
          help.buttonWithBorder("Sign Up", white, () { }, upBgCl, upBrCl, upSiz)
        ],
      ),
    );
  }
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
                help.spaces(),
                Image.asset(logoPath),
                help.spaces(hight: 35),
                langAndSignup()],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: mainContainer(),
      ),
    );
  }
}
