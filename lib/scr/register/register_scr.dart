import 'package:flutter/material.dart';
import 'package:delivery15/scr/help.dart';

class registerScr extends StatefulWidget {
  const registerScr({Key? key}) : super(key: key);

  @override
  _registerScrState createState() => _registerScrState();
}

class _registerScrState extends State<registerScr> {
  // text Controlers
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController idCardNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController password = TextEditingController();


  //vars
  String bg1Path = "images/bg/bg register.png";
  String logoPath = "images/other/logod.png";
  String descrpt =
      "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.";
  Color upBgCl = Color(0xfff5a831);

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

  // registerField
  Container registerFields() => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            help.textEditWithIcon(Icons.person_outline_sharp,fullName, 'User name'),
            help.textEditWithIcon(Icons.call,phoneNumber, '0123456789'),
            help.textEditWithIcon(Icons.call,idCardNumber, 'identity'),
            help.textEditWithIcon(Icons.email_outlined,email, 'email@examble.com'),
            help.textEditWithIcon(Icons.call,birthDate, 'Date of Birth'),
            help.textEditWithIcon(Icons.call,location, 'Address place'),
            help.textEditWithIcon(Icons.call,password, '****', password: true),

          ],
        ),
      );

  // register Button
  Container registerButton()=>Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: help.buttonWithBorder("REGISTER", Colors.white, () { }, upBgCl, upBgCl, Size(300, 50)),
        )
      ],
    ),
  );

  //main Container
  Container mainContainer() => Container(
        height: double.infinity,
        decoration: help.background(bg1Path, .8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              help.spaces(),
              logoAndDescrip(),
              help.spaces(),
              registerFields(),
              help.spaces(hight: 50),
             registerButton(),
              help.spaces()
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: mainContainer(),
    );
  }
}
