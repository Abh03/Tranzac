import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/pages/abstract.dart';
import 'package:tranzac/pages/signup.dart';

logIn(email, password, context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(
                      child: Text("Logged in successfully",
                          style: TextStyle(fontFamily: 'FiraSans'))),
                  duration: Duration(seconds: 3),
                )))
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Abstract())));
  } catch (e) {
    debugPrint("Some error occured");
  }
}

reset(email, context) {
  try {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(
                      child: Text("Link sent successfully",
                          style: TextStyle(fontFamily: 'FiraSans'))),
                  duration: Duration(seconds: 3),
                )))
        .then((value) => Navigator.pop(context));
  } catch (e) {
    debugPrint("Some error occured");
  }
}

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

  @override
  void dispose() {
    email.dispose();
    pwd.dispose();
    fmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
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
        body: Stack(children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  color: Color(0xFF024578),
                ),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Center(
                      child: Container(
                        margin: marginLogo,
                        child: Column(
                          children: [
                            const Text(
                              'LOGO',
                              style: TextStyle(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Welcome to ",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Tranzac",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.orange[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => const Color(0xFF024578)),
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white)),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                logIn(email.text, pwd.text, context);
                              }
                            },
                            child: const Text("Log In")),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        actions: [
                                          TextFormField(
                                            controller: fmail,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                hintText: "Enter your email",
                                                labelText: "Email",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                          ),
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateColor
                                                          .resolveWith((states) =>
                                                              const Color(
                                                                  0xFF024578)),
                                                  foregroundColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                              (states) => Colors
                                                                  .white)),
                                              onPressed: () {
                                                reset(fmail.text, context);
                                              },
                                              child: const Text("Send link"))
                                        ],
                                      ));
                            },
                            child: const Text("Forgot Password?",
                                style: TextStyle(color: Color(0xFF024578)))),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Color(0xFF024578)),
                            ))
                      ],
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
