import 'package:flutter/material.dart';

class helpDis {
  //background
  BoxDecoration background(String imgPath, double opacity) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(opacity), BlendMode.dstATop)));
  }

  //TextButton
  OutlinedButton buttonWithBorder(String txt, Color txtClr, void function(),
      Color bgClr, Color brderClr, Size sizee) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: sizee,
          backgroundColor: bgClr,
          side: BorderSide(width: .7, color: brderClr),
        ),
        onPressed: function,
        child: Text(
          txt,
          style: TextStyle(color: txtClr, fontSize: 20),
        ));
  }

  //TextButton
  OutlinedButton buttonWithBorderNosize(
      String txt, Color txtClr, void function(), Color bgClr, Color brderClr) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: bgClr,
          side: BorderSide(width: .8, color: brderClr),
        ),
        onPressed: function,
        child: Text(
          txt,
          style: TextStyle(color: txtClr, fontSize: 20),
        ));
  }

  //-------------
  //textEdit with icon
  TextField textEditWithIcon(
          String icoName, TextEditingController controll, String hint,
          {bool password = false}) =>
      TextField(
        obscureText: password,
        enableSuggestions: !password,
        autocorrect: !password,
        style: TextStyle(color: Colors.white),
        controller: controll,
        decoration: InputDecoration(
          prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                'images/icons/$icoName.png',
              )),
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff606060)),
          isDense: true,
          contentPadding: EdgeInsets.only(top: 30),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      );

  //temp
  MaterialButton testbutton(
      String txt, Color txtClr, void function(), Color bgClr, Color brderClr) {
    return MaterialButton(
      onPressed: function,
      color: bgClr,
      child: Text(
        txt,
        style: TextStyle(color: txtClr, fontSize: 20),
      ),
    );
  }

  // ^^^^^^ temp ^^^^^^

  //spaces
  Container spaces({double hight: 20}) => Container(
        height: hight,
      );

  Container test(bool bord) {
    if (bord) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blueAccent,
          width: bord ? 0 : 1,
        )),
      );
    }
    return Container();
  }
}
