import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tranzac/pages/qr_sewa.dart'; // Import your QrSewa page
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
        title: const Text(
          "QR Code Scanner",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: height * 0.1,
            right: width * 0.05,
            left: width * 0.05,
            bottom: height * 0.1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Scan To Pay',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Place the QR code in the area',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: height * 0.2,
            right: width * 0.1,
            left: width * 0.1,
            bottom: height * 0.2,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                log('Barcode found: ${barcodes.first.rawValue}');

                String? jsonString = barcodes.first.rawValue;
                try {
                  Map<String, dynamic> jsonData = jsonDecode(jsonString!);

                  if (jsonData.containsKey('eSewa_id')) {
                    String eSewaId = jsonData['eSewa_id'] as String;
                    log('Found eSewa ID: $eSewaId');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrSewa(
                          mobile: eSewaId,
                          paymentType: 'esewa',
                        ),
                      ),
                    );
                  } else if (jsonData.containsKey('Khalti_ID')) {
                    // Corrected to 'Khalti_ID'
                    String khaltiId = jsonData['Khalti_ID']
                        as String; // Corrected to 'Khalti_ID'
                    log('Found Khalti ID: $khaltiId');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrSewa(
                          mobile: khaltiId,
                          paymentType: 'khalti',
                        ),
                      ),
                    );
                  } else {
                    // Handle unrecognized QR codes (show error message, etc.)
                    log('Unrecognized QR code content');
                    // Optionally show error message or handle differently
                  }
                } catch (e) {
                  log('Error decoding JSON: $e');
                  // Handle JSON parsing errors (invalid QR code format)
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
