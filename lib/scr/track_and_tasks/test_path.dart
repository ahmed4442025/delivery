import 'package:flutter/material.dart';

class testPath extends StatefulWidget {
  const testPath({Key? key}) : super(key: key);

  @override
  _testPathState createState() => _testPathState();
}

class _testPathState extends State<testPath> {
  //mainContainer
  Widget mainContainer(Size size) => Container(
        height: size.height * .8,
        width: size.width * .8,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.yellow],
          ),
        ),
    child: Image.asset('images/bg/istockphoto.png'),
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child:
              ClipPath(clipper: myCustomClipper(), child: mainContainer(size))),
    );
  }
}

class myCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double y = size.height;
    double x = size.width;
    var path = Path();
    path.lineTo(0, y);  //start
    path.quadraticBezierTo(x/2, y-90, x, y);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
