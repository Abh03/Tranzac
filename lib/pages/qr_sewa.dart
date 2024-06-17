import 'dart:developer';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/function/esewa_backend.dart';
import 'package:tranzac/function/khalti.dart';

class QrSewa extends StatefulWidget {
  final String mobile;
  final String?
      paymentType; // Added paymentType to distinguish between eSewa and Khalti
  const QrSewa({Key? key, required this.mobile, this.paymentType})
      : super(key: key);

  @override
  _QrSewaState createState() => _QrSewaState();
}

class _QrSewaState extends State<QrSewa> {
  late TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController(text: widget.mobile);
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void initiatePayment() {
    final String mobileNumber = mobileNumberController.text;
    final String amount = amountController.text;

    if (widget.paymentType == 'esewa') {
      Esewa esewa = Esewa();
      esewa.pay(mobileNumber, amount);
    } else if (widget.paymentType == 'khalti') {
      payWithKhaltiApp(context, mobileNumberController, amountController);
    } else {
      log('Invalid payment type provided: ${widget.paymentType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kLightGreyColor,
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: MediaQuery.of(context).padding.top + 12,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: kNewAppBarColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Send Money',
                  style: TextStyle(
                    color: kNewAppBarColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: MediaQuery.of(context).padding.top + 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kNewAppBarColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rs. 6500',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Available Balance',
                            style: TextStyle(
                              color: klightTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: kNewAppBarColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile Number',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Amount',
                        style: TextStyle(
                          color: kNewAppBarColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          hintText: 'Enter Amount To Pay',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: initiatePayment,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kNewAppBarColor),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
