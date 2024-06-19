import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/pages/abstract.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final fn = TextEditingController();
  final mn = TextEditingController();
  final ln = TextEditingController();
  final dob = TextEditingController();
  final gr = TextEditingController();
  final ocn = TextEditingController();
  final ms = TextEditingController();
  final pn = TextEditingController();
  final ca = TextEditingController();
  final pa = TextEditingController();
  final email = TextEditingController();
  final pwd = TextEditingController();
  final cpwd = TextEditingController();

  @override
  void dispose() {
    fn.dispose();
    mn.dispose();
    ln.dispose();
    dob.dispose();
    gr.dispose();
    ocn.dispose();
    ms.dispose();
    pn.dispose();
    ca.dispose();
    pa.dispose();
    email.dispose();
    pwd.dispose();
    cpwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: const Color(0xFFD7DEE8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.35,
                  width: width * 0.95,
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
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Centered image instead of text
                        Center(
                          child: Image.asset(
                            'assests/images/logo1.png',
                            // Replace with your image path
                            height: 190, // Adjust height as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                height: height * 0.83,
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  width: width * 0.85,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 25, color: kNewAppBarColor),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Personal Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Divider(),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: fn,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$').hasMatch(
                                            value)) {
                                      return "Please enter correct name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your first name",
                                    labelText: "First name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: mn,
                                  validator: (value) {
                                    if (RegExp(r'^[a-z A-Z]+$').hasMatch(
                                        value!)) {
                                      return "Please enter correct name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your middle name",
                                    labelText: "Middle name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: ln,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$').hasMatch(
                                            value)) {
                                      return "Please enter correct name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your last name",
                                    labelText: "Last name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: dob,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(
                                            r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4}')
                                            .hasMatch(value)) {
                                      return "Please enter correct date of birth";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.url,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your DoB (dd/mm/yyyy)",
                                    labelText: "Date of Birth",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownMenu(
                                  controller: gr,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.8,
                                  inputDecorationTheme: const InputDecorationTheme(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                  hintText: "Gender",
                                  label: const Text("Gender"),
                                  menuStyle: MenuStyle(
                                    surfaceTintColor: MaterialStateColor
                                        .resolveWith(
                                            (states) =>
                                        const Color(0xFFD7DEE8)),
                                    backgroundColor: MaterialStateColor
                                        .resolveWith(
                                            (states) =>
                                        const Color(0xFFD7DEE8)),
                                  ),
                                  dropdownMenuEntries: const <
                                      DropdownMenuEntry<String>>[
                                    DropdownMenuEntry(
                                        value: "Male", label: "Male"),
                                    DropdownMenuEntry(
                                        value: "Female", label: "Female"),
                                    DropdownMenuEntry(
                                        value: "Others", label: "Others"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: ocn,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$').hasMatch(
                                            value)) {
                                      return "Please enter correct occupation";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your occupation",
                                    labelText: "Occupation",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropdownMenu(
                                  controller: ms,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.8,
                                  inputDecorationTheme: const InputDecorationTheme(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                  hintText: "Marital Status",
                                  label: const Text("Marital Status"),
                                  menuStyle: MenuStyle(
                                    surfaceTintColor: MaterialStateColor
                                        .resolveWith(
                                            (states) =>
                                        const Color(0xFFD7DEE8)),
                                    backgroundColor: MaterialStateColor
                                        .resolveWith(
                                            (states) =>
                                        const Color(0xFFD7DEE8)),
                                  ),
                                  dropdownMenuEntries: const <
                                      DropdownMenuEntry<String>>[
                                    DropdownMenuEntry(
                                        value: "Single", label: "Single"),
                                    DropdownMenuEntry(
                                        value: "Married", label: "Married"),
                                    DropdownMenuEntry(
                                        value: "Others", label: "Others"),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: pn,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[0-9]{10}$').hasMatch(
                                            value)) {
                                      return "Please enter correct mobile number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your mobile number",
                                    labelText: "Mobile number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Address Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Divider(),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: ca,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$').hasMatch(
                                            value)) {
                                      return "Please enter correct address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your Current address",
                                    labelText: "Current address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: pa,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$').hasMatch(
                                            value)) {
                                      return "Please enter correct address";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your Permanent address",
                                    labelText: "Permanent address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Account Details",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Divider(),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: email,
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
                                    hintText: "Enter your email address",
                                    labelText: "Email address",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: pwd,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+[0-9]+$').hasMatch(
                                            value)) {
                                      return "Please enter password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Enter your password",
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: cpwd,
                                  validator: (value) {
                                    if (cpwd.text != pwd.text) {
                                      return "Password do not match";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    hoverColor: kNewAppBarColor,
                                    hintText: "Re-enter your password",
                                    labelText: "Confirm password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor
                                          .resolveWith(
                                              (states) => kNewAppBarColor),
                                      foregroundColor: MaterialStateColor
                                          .resolveWith(
                                              (states) => Colors.white),
                                    ),
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        try {
                                          await _auth
                                              .createUserWithEmailAndPassword(
                                            email: email.text,
                                            password: pwd.text,
                                          );

                                          await collref.collection('Users').doc(
                                              email.text).set({
                                            'Name first': fn.text.trim(),
                                            'Name middle': mn.text.trim(),
                                            'Name last': ln.text.trim(),
                                            'Date of birth': dob.text.trim(),
                                            'Gender': gr.text.trim(),
                                            'Occupation': ocn.text.trim(),
                                            'Marital status': ms.text.trim(),
                                            'Mobile number': pn.text.trim(),
                                            'Address current': ca.text.trim(),
                                            'Address permanent': pa.text.trim(),
                                            'Email': email.text.trim(),
                                          }).whenComplete(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Center(
                                                  child: Text(
                                                    "Signed up successfully",
                                                    style: TextStyle(
                                                        fontFamily: 'FiraSans'),
                                                  ),
                                                ),
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          }).then((value) =>
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      context) => const Abstract(),
                                                ),
                                              ));
                                        } catch (e) {
                                          debugPrint("Some error occured");
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
