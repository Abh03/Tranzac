import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/pages/Signup.dart';


class QR extends StatefulWidget {
  const QR({super.key});

  @override
  State<QR> createState() => _QRState();
}


class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFD7DEE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF024578),
        title: const Center(
          child: Text(
              "QR code scanner",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container( //1
            margin: const EdgeInsets.all(10),
            height:height*0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF3C6E98),
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    child:  Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Scan To Pay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                          right: 1.5,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            )
                          ),
                          child: const Text(
                              'Scanner',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color(0xFF024578),
                            ),
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 1.5,
                          right: 10,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                            )
                          ),
                          child: const Text(
                              'My QR Code',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color(0xFF024578),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),  //1
           Container(
             margin: EdgeInsets.only(
               top: height * 0.2,
               right: width * 0.1,
               left: width * 0.1,
               bottom: height * 0.1
             ),
             child: MobileScanner(
               controller: MobileScannerController(
                 detectionSpeed: DetectionSpeed.noDuplicates,
               ),
               onDetect: (capture) {
                 final List<Barcode> barcodes = capture.barcodes;
                   log('Barcode found: ${barcodes.first.rawValue}');
               },
             ),
           )
        ],
      )
    );
  }
}
