import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clipping Tools',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clipping Tools'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: Colors.blue,
                  height: 300,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRect(
                child: Align(
                  alignment: Alignment(0.5, 0.5),
                  heightFactor: 0.7,
                  child: Image.network(
                    "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Align(
                  heightFactor: 0.7,
                  widthFactor: 0.7,
                  child: Image.network(
                    "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipOval(
                clipper: MyClipper(),
                child: Align(
                  heightFactor: 0.7,
                  widthFactor: 0.7,
                  child: Image.network(
                    "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg",


                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath  extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(
        width*0.5,
        height-100,
        width,
        height
    );

    path.lineTo(width, 0);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }


}

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: Offset(80, 100),radius: 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}