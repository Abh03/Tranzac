import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/abstract.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final email = TextEditingController();
  final pwd = TextEditingController();
  final fmail = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    email.dispose();
    pwd.dispose();
    fmail.dispose();
    super.dispose();
  }

// Function to handle login
  void logIn(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the Abstract screen upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Abstract()),
      );

      // Show success message or perform other actions
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Text(
              "Logged in successfully",
              style: TextStyle(fontFamily: 'FiraSans'),
            ),
          ),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Handle specific authentication errors
      if (e is FirebaseAuthException) {
        if (password != pwd) {
          setState(() {
            errorMessage = "Wrong password. Please try again.";
          });
        }
      }

      // Show error message in SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              errorMessage!,
              style: TextStyle(fontFamily: 'FiraSans'),
            ),
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void reset(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Center(
            child: Text("Link sent successfully",
                style: TextStyle(fontFamily: 'FiraSans'))),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
    } catch (e) {
      debugPrint("Some error occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    EdgeInsets marginLogo = EdgeInsets.only(top: height * 0.15);
    EdgeInsets marginContainer = EdgeInsets.only(top: height * 0.05);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFD7DEE8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kNewAppBarColor,
                        kGradientChange,
                      ],
                      stops: [0.35, 1],
                    ),
                  ),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: marginLogo,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: <Color>[
                                  kNewAppBarColor,
                                  kLightGreyColor,
                                ],
                                stops: [0.0, 1.0],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: "Welcome To ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: Color(0xff4b9685),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Tranzac!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Color(0xff155e4f),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: marginContainer,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                width: 333,
                height: 333,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@gmail.com')
                                    .hasMatch(value)) {
                              return "Please enter correct email";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: pwd,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+[0-9]+$')
                                    .hasMatch(value)) {
                              return "Please enter password";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              errorMessage!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Center(
                                  child: Text("Reset password"),
                                ),
                                actionsPadding: const EdgeInsets.all(10),
                                actions: [
                                  TextFormField(
                                      controller: fmail,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\.]+@+[\w-\.]+.com')
                                                .hasMatch(value)) {
                                          return "Please enter correct email";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hoverColor: kNewAppBarColor,
                                        hintText:
                                            "Enter email address to send link",
                                        labelText: "Email address",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    const Color(0xFF024578)),
                                        foregroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.white),
                                      ),
                                      onPressed: () {
                                        reset(fmail.text, context);
                                      },
                                      child: Container(
                                          child: const Text("Send link")),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: kNewAppBarColor),
                          ),
                        ),
                        Container(
                          width: 330,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => kNewAppBarColor),
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            onPressed: () {
                              setState(() {
                                errorMessage = null; // Clear previous errors
                              });
                              if (formkey.currentState!.validate()) {
                                logIn(email.text, pwd.text, context);
                              }
                            },
                            child: const Text("Log In"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              child: const Text(
                                "Register Now",
                                style: TextStyle(color: kNewAppBarColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
