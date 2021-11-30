import 'package:flutter/material.dart';
import 'package:delivery15/scr/register/forget_password_src.dart';
import 'package:delivery15/scr/register/register_scr.dart';
import 'package:delivery15/scr/register/login.dart';
import 'package:delivery15/scr/register/home_scr.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  _contactUsState createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  Color defultColorNotActive = Color(0xff457a7f);
  Color defultColorActive = Colors.orange;
  double iconSize = 30;
  double bottomBarH = 70;

  // double bottomBarCornerH = 30;
  double iconsPaddingBottom = 10;
  int currentIndex = 0;

  bool firstRun = true;
  Widget currentPage = Container();

  doSomeThing() {
    // pressed buttons
    if (currentIndex == 0) {
      // pressed button 0 > > your code here . .
      print('you pressed button home');
      currentPage = homeScr();
    } else if (currentIndex == 1) {
      // pressed button 1 > > your code here . .
      print('you pressed button ring');
      currentPage = forgetPassword();
    } else if (currentIndex == 2) {
      // pressed button 2 > > your code here . .
      print('you pressed button shop');
      currentPage = registerScr();
    } else if (currentIndex == 3) {
      // pressed button 3 > > your code here . .
      print('you pressed button profile');
      currentPage = loginScr();
    }
  }

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  //main continer
  Widget mainContainer() => Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFB57F2C),
              Color(0XFF145155),
            ],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Image.asset('images/other/logod.png'))],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (firstRun) {
      currentPage = mainContainer();
      firstRun = false;
    }
    return Scaffold(
      // bottomNavigationBar: bottomBar2(size),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: myCustomClipperRemoveBottom(),
                  child: Container(height: size.height, child: currentPage),
                ),
                Container(height: 30,)
              ],
            ),
          ),
          Positioned(bottom: 0, left: 0, child: bottomBar2(size))
        ],
      ),
    );
  }

  //---------------------------------

  Widget bottomBar2(Size size) => Container(
        width: size.width,
        height: bottomBarH,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(size.width, bottomBarH),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.1,
              child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  // child: Icon(Icons.shopping_basket),
                  child: Image.asset('images/other/logod.png'),
                  elevation: 0.1,
                  onPressed: () {}),
            ),
            Container(
              width: size.width,
              height: bottomBarH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: iconSize,
                        icon: Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? defultColorActive
                              : defultColorNotActive,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                          doSomeThing();
                        },
                        //splashColor: Colors.white,
                      ),
                      IconButton(
                          iconSize: iconSize,
                          icon: Icon(
                            Icons.notifications,
                            color: currentIndex == 1
                                ? defultColorActive
                                : defultColorNotActive,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                            doSomeThing();
                          }),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          iconSize: iconSize,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: currentIndex == 2
                                ? defultColorActive
                                : defultColorNotActive,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                            doSomeThing();
                          }),
                      IconButton(
                          iconSize: iconSize,
                          icon: Icon(
                            Icons.person_sharp,
                            color: currentIndex == 3
                                ? defultColorActive
                                : defultColorNotActive,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                            doSomeThing();
                          }),
                    ],
                  ),
                  Container(
                    height: iconsPaddingBottom,
                  )
                ],
              ),
            )
          ],
        ),
      );
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size, {double cornerH = 30}) {
    Paint paint = new Paint()
      ..color = Color(0xff115056)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, cornerH); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.5, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, cornerH);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, cornerH);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class myCustomClipperRemoveBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double y = size.height;
    double x = size.width;
    var path = Path();
    path.lineTo(0, y); //start
    path.quadraticBezierTo(x / 2, y - 80, x, y);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
