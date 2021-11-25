import 'package:flutter/material.dart';
import 'package:delivery15/scr/help.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  // text Controlers
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController idCardNumber = TextEditingController();
  TextEditingController email = TextEditingController();


  //vars
  String bg1Path = "images/bg/bg register.png";
  String descrpt1 = "Forget password !";
  String descrpt2 = "Please fill in the following";
  Color upBgCl = Color(0xfff5a831);
  Color upBrCl = Color(0xffeb1b2f);

  //class
  helpDis help = new helpDis();

  // description
  Container Descrip() => Container(
    child: Column(
      children: [
        Text(
          descrpt1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        help.spaces(),
        Text(
          descrpt2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ],
    ),
  );

  // registerField
  Container registerFieldsAndConfirm() => Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        help.textEditWithIcon('phone',phoneNumber, '0123456789'),
        help.textEditWithIcon("phone",idCardNumber, 'identity'),
        help.textEditWithIcon("phone",email, 'email@examble.com'),
        help.spaces(hight: 50),
        confirmButton()
      ],
    ),
  );

  // confirm Button
  Container confirmButton()=>Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: help.buttonWithBorder("CONFIRM", Colors.white, () { }, upBgCl, upBrCl, Size(300, 45)),
        )
      ],
    ),
  );

  //main Container
  Container mainContainer() => Container(
    height: double.infinity,
    decoration: help.background(bg1Path, .8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        help.spaces(hight: 1),
        Descrip(),
        registerFieldsAndConfirm(),
        help.spaces()
      ],
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContainer(),
    );
  }
}
