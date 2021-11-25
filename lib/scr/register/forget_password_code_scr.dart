import 'package:flutter/material.dart';
import 'package:delivery15/scr/help.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class forgetPassCode extends StatefulWidget {
  const forgetPassCode({Key? key}) : super(key: key);

  @override
  _forgetPassCodeState createState() => _forgetPassCodeState();
}

class _forgetPassCodeState extends State<forgetPassCode> {
  // text Controlers
  TextEditingController code = TextEditingController();

  //vars
  String bg1Path = "images/bg/bg register.png";
  String descrpt1 = "Forget password !";
  String descrpt2 = "Please fill in the following";
  String descrpt3 = "Write code that sent to your number";
  Color upBgCl = Color(0xfff5a831);
  Color upBrCl = Color(0xffeb1b2f);
  Color pinUnderLineCl = Color(0xff115056);

  //class
  helpDis help = new helpDis();

  // description
  Container Descrip() => Container(
        child: Column(
          children: [
            Text(
              descrpt1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            help.spaces(),
            Text(
              descrpt2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      );

  // pinCode
  Container pinCodeFieldsAndConfirm() => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Text(
              descrpt3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            help.spaces(),
            Container(
              padding: EdgeInsets.only(left: 25,right: 25, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: VerificationCode(
                  textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  underlineColor: pinUnderLineCl,
                  onCompleted: (String value) {},
                  onEditing: (bool value) {}),
              // child: PinCodeTextField(
              //   onChanged: (String vlue){},
              //   appContext: context,
              //   length: 4,
              // ),
            ),
            help.spaces(hight: 100),
            confirmButton()
          ],
        ),
      );

  // confirm Button
  Container confirmButton() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: help.buttonWithBorder("CONFIRM", Colors.white, () {},
                  upBgCl, upBrCl, Size(300, 45)),
            )
          ],
        ),
      );

  //main Container
  Container mainContainer() => Container(
        height: double.infinity,
        decoration: help.background(bg1Path, .8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            help.spaces(hight: 1),
            Descrip(),
            pinCodeFieldsAndConfirm(),
            help.spaces(hight: 1),
            help.spaces(hight: 1)
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
