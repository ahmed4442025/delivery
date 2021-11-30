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

  Map<String, dynamic> bActive = {
    'colorBg': Color(0x44f5a831),
    'colorFont': Color(0xff115056),
    'enable': false
  };
  bool isSubmitEnabled = false;

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
            help.textEditWithIcon(
                Icons.person_outline_sharp, fullName, 'User name',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(Icons.call, phoneNumber, '0123456789',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(Icons.call, idCardNumber, 'identity',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(
                Icons.email_outlined, email, 'email@examble.com',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(Icons.call, birthDate, 'Date of Birth',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(Icons.call, location, 'Address place',
                onChang: checkAllNotEmpity),
            help.textEditWithIcon(Icons.lock, password, '****',
                password: true, onChang: checkAllNotEmpity),
          ],
        ),
      );

  // register Button
  Container registerButton() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: help.buttonWithBorder("REGISTER", bActive['colorFont'],
                    () {}, bActive['colorBg'], bActive['colorBg'], Size(300, 50),
                    enable: bActive['enable']),
              ),
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

  // all values is ok
  checkAllNotEmpity(String value) {
    bool empty = true;
    if (fullName.text != '' &&
        fullName.text != '' &&
        phoneNumber.text != '' &&
        idCardNumber.text != '' &&
        email.text != '' &&
        birthDate.text != '' &&
        location.text != '' &&
        password.text != '') empty = false;
    Map<String, dynamic> bActiveTrue = {
      'colorBg': Color(0xfff5a831),
      'colorFont': Colors.white,
      'enable': true
    };

    Map<String, dynamic> bActiveFalse = {
      'colorBg': Color(0x44f5a831),
      'colorFont': Color(0xff115056),
      'enable': false
    };

    if (empty && isSubmitEnabled) {
      setState(() {
        bActive = bActiveFalse;
        isSubmitEnabled = false;
      });
    } else if (!empty && !isSubmitEnabled) {
      setState(() {
        bActive = bActiveTrue;
        isSubmitEnabled = true;
      });
    }
  }
}
