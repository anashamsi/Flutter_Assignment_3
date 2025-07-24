import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/Login_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(height: 300, color: Colors.orangeAccent),
              ),
              Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,

                    backgroundColor: Colors.white,

                    child: ClipOval(
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/thumbnails/008/826/851/small_2x/abstract-initial-letter-mz-logo-in-black-color-isolated-in-white-background-applied-for-clothing-brand-logo-also-suitable-for-the-brands-or-companies-that-have-an-initial-name-zm-vector.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 36,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Tap Continue to begin",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 30),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  label: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
