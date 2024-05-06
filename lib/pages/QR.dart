import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QR extends StatefulWidget {
  const QR({super.key});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("QR code scanner"),
        ),
      ),
      body: const Center(
        child: Text("Qr page"),
      ),
    );
  }
}
