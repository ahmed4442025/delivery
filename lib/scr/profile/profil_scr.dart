import 'package:flutter/material.dart';
import 'package:delivery15/scr/help.dart';

class profilScr extends StatefulWidget {
  const profilScr({Key? key}) : super(key: key);

  @override
  _profilScrState createState() => _profilScrState();
}

class _profilScrState extends State<profilScr> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: mainContainer(size),
    );
  }

  // - - - - - - - - - - - - //
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController idCard = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController address = TextEditingController();

  helpDis help = helpDis();
  String manImag = 'images/other/man.png';
  Color bottomColor = Color(0xfff5a831);

  // take photo icon
  Widget takePhoto() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff104046),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              )
            ]),
        child: Icon(
          Icons.camera_alt_outlined,
          color: bottomColor,
        ),
      );
  Widget takePhoto2() => Container(
    child: OutlinedButton(
      onPressed: (){},
      child: Icon(
        Icons.camera_alt_outlined,
        color: bottomColor,
      ),
    )
  );


  // image with frame
  Widget imageWithFram({Size size = const Size(130, 130)}) => Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            image: AssetImage(manImag),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(size.height)),
          border: Border.all(
            color: bottomColor,
            width: 3.0,
          ),
        ),
      );

  // profile photo and take picture logo
  Widget pictureAndName(Size size) => Container(
        width: double.infinity,
        height: size.height * .4,
        decoration: BoxDecoration(
          color: Color(0xee115056),
          borderRadius: BorderRadius.circular(50),
        ),
        //------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [imageWithFram(), takePhoto2()],
            ),
            // name
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Text(
                'ahmed mohamed',
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  // profile Info Edit
  Widget profileInfo(Size size) => Container(
        height: size.height * .6,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              help.textEditWithIcon(Icons.person_outline_sharp, name, 'hint'),
              help.textEditWithIcon(Icons.call, phone, 'hint'),
              help.textEditWithIcon(Icons.ten_mp, idCard, 'hint'),
              help.textEditWithIcon(Icons.email, email, 'hint'),
              help.textEditWithIcon(
                  Icons.add_ic_call_outlined, dateBirth, 'hint'),
              help.textEditWithIcon(Icons.star, address, 'hint'),
            ],
          ),
        ),
      );

  //main container
  Widget mainContainer(Size size) => Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              pictureAndName(size),
              profileInfo(size),
            ],
          ),
        ),
      );
}
