import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assests/images/splash2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              width: 250,
              child: Text(
                "Welcome to Tranzac",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                new SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF526D82),
                      padding: EdgeInsets.all(07),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                new SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF526D82),
                      padding: EdgeInsets.all(07),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Button border radius
                      ),
                    ),
                    child: Text(
                      "Sign up ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
