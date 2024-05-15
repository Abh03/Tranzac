import 'package:flutter/material.dart';
import 'package:tranzac/pages/login.dart';
import 'package:tranzac/pages/Signup.dart';
import 'package:tranzac/constants.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    EdgeInsets marginWelcome = EdgeInsets.only(top: height * 0.15);
    EdgeInsets marginButtons = EdgeInsets.only(top: height * 0.7);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Image.asset(
              'assests/images/splash2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: margin_welcome,
                width: 250,
                child: const Text(
                  "Welcome to Tranzac",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: margin_buttons,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: kSecondBackgroundColor,
                        padding: const EdgeInsets.all(07),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Button border radius
                        ),
                      ),
                      child: const Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: kSecondBackgroundColor,
                        padding: const EdgeInsets.all(07),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Button border radius
                        ),
                      ),
                      child: const Text(
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
      ),
    );
  }
}
