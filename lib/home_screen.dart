import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCFCFC),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFDEE2FF), Color(0xFFB6BFFF)]),
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SizedBox(width: 5),
            Text("ÇORAP",
                style: GoogleFonts.poppins(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffd700))),
            SizedBox(width: 5),
            FaIcon(
              FontAwesomeIcons.socks,
              color: Color(0xFF3E3D3D),
            )
          ]),
          SizedBox(height: 5),
          SizedBox(height: 10),
          SizedBox(height: 10),
          GestureDetector(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(
            //     builder: (context) {
            //       // return
            //     },
            //   ));
            // },
            child: CardSelect(
                image: "assets/img/a2.png",
                title: "Çorapla Kazan",
                text: "Görevi tamamla ve para kazanmaya hemen başla..."),
          ),
          GestureDetector(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(
            //     builder: (context) {
            //       //   return  ;
            //     },
            //   ));
            // },
            child: CardSelect(
                image: "assets/img/a1.png",
                title: "Reklam Ver",
                text:
                    "Size uygun görevleri tanımlayın ve dilediğiniz hizmeti alın..."),
          ),
        ])));
  }
}

class CardSelect extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const CardSelect(
      {Key? key, required this.image, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFDEE2FF), Color(0xFFB6BFFF)]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 24,
                          color: Colors.black.withOpacity(.3))
                    ])),
            Image.asset(image),
            Positioned(
                left: 140,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(title,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF3E3D3D))),
                        ),
                        Text(
                          text,
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black),
                        )
                      ]),
                ))
          ],
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2 - 60, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
