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

  List<String> categories = [
    'Food',
    'Education',
    'Household',
    'Social Life',
    'Pets',
    'Transportation',
    'Health',
    'Beauty',
    'Apparel',
    'Electronics and Appliances',
    'Others'
  ];
  String? selectedCategory;

  Map<String, IconData> categoryIcons = {
    'Food': Icons.fastfood,
    'Education': Icons.school,
    'Household': Icons.house_outlined,
    'Beauty': Icons.face,
    'Social Life': Icons.people,
    'Pets': Icons.pets,
    'Transportation': Icons.emoji_transportation,
    'Health': Icons.favorite,
    'Apparel': Icons.backpack,
    'Electronics and Appliances': Icons.phone_android,
    'Others': Icons.category,
  };

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
    final String? category = selectedCategory;

    if (widget.paymentType == 'esewa') {
      Esewa esewa = Esewa();
      esewa.pay(mobileNumber, amount, category);
    } else if (widget.paymentType == 'khalti') {
      payWithKhaltiApp(context, mobileNumberController, amountController, selectedCategory);
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
                      const Text(
                        'Categories',
                        style: TextStyle(
                          color: kNewAppBarColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedCategory,
                            hint: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text('Select Category'),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            items: categories.map((category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        categoryIcons[category]!,
                                        color: kNewAppBarColor,
                                      ),
                                      SizedBox(width: 10),
                                      Text(category),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
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
