import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    EdgeInsets marginBox = EdgeInsets.only(top: height * 0.13);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFD7DEE8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.35,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        color: Color(0xFF02457A)),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      padding: const EdgeInsets.all(30.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.arrow_back),
                          //   iconSize: 30,
                          //   color: Colors.white,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Center(
                              child: Text(
                            "Create Account",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: marginBox,
                  height: height * 0.80,
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 310,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 25, color: Color(0xFF526D82)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Enter your first name',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Enter your middle name',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Enter your last name',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Enter your mobile number',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Enter your email address',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        //   width: 280,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(05)),
                        //       color: Color(0xFFD9D9D9)),
                        //   child: const Text(
                        //     'Re-enter your password',
                        //     style:
                        //         TextStyle(color: Color(0xFF818181), fontSize: 15),
                        //   ),
                        // ),
                        TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your first name",
                              labelText: "First name",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your middle name",
                              labelText: "Middle name",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your last name",
                              labelText: "Last name",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your mobile number",
                              labelText: "Mobile number",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your email address",
                              labelText: "Email address",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Enter your password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hoverColor: Color(0xFF024578),
                              hintText: "Re-enter your password",
                              labelText: "Confirm password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          width: 280,
                          height: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(05)),
                              color: Color(0xFF526D82)),
                          child: const Text(
                            'Sign Up ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Log In',
                              style: TextStyle(
                                  color: Color(0xFF526D82), fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
