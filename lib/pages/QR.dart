import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tranzac/pages/Login.dart';
import 'package:tranzac/pages/Signup.dart';
import 'package:tranzac/pages/qr_sewa.dart';
import 'package:tranzac/pages/sendmoney.dart';
import 'package:tranzac/constants.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

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
        backgroundColor: kNewAppBarColor,
        title: const Center(
          child: Text(
            "QR Code Scanner",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            height: height * 0.08,
            width: width * 0.95, // Increase the width here (95% of screen width)
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kNewAppBarColor,
                  kGradientChange,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Scan To Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.2,
              right: width * 0.1,
              left: width * 0.1,
              bottom: height * 0.2,
            ),
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                log('Barcode found: ${barcodes.first.rawValue}');

                String jsonString = '''
                  ${barcodes.first.rawValue}
                ''';

                Map<String, dynamic> jsonData = jsonDecode(jsonString);
                String eSewaId = jsonData['eSewa_id'];
                log('found it yeah: $eSewaId');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrSewa(mobile: eSewaId),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
