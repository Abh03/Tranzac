import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/function/esewa_backend.dart';

class QrSewa extends StatefulWidget {
  final String mobile;
  const QrSewa({Key? key, required this.mobile}) : super(key: key);

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

  void sendToEsewaBackend() {
    final String mobileNumber = mobileNumberController.text;
    final String amount = amountController.text;
    Esewa esewa = Esewa();
    // Call your esewa backend function here with the input values
    esewa.pay(mobileNumber, amount);
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
                  icon: const Icon(Icons.arrow_back, color: kActiveIconColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Send Money',
                  style: TextStyle(
                    color: kActiveIconColor,
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
                    color: kActiveIconColor,
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
                            style: TextStyle(color: klightTextColor, fontSize: 16), // Decreased font size
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: kActiveIconColor,
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
                          color: kActiveIconColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10), // Added space here
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
                        onPressed: sendToEsewaBackend,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(kActiveIconColor), // Background color
                          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)), // Text color
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)), // Padding
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ), // Button shape
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
