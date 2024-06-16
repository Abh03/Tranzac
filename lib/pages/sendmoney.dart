import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/function/esewa_backend.dart';
import 'package:tranzac/function/khalti.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final TextEditingController mobileNumberController = TextEditingController();
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
  ]; // Your list of categories
  String? selectedCategory;

  // Map to store icons for each category
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
    'Others': Icons.category, // Added icon for 'Others'
  };

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
    final String? esewa_id =
        ModalRoute.of(context)?.settings.arguments as String?;

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
                  padding: const EdgeInsets.all(12),
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
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rs. 6500',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Available Balance',
                            style:
                                TextStyle(color: Colors.green, fontSize: 16),
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
                        width: double.infinity,
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
                                        categoryIcons[
                                            category], // Icon for each category
                                        color: kNewAppBarColor, // Icon color
                                      ),
                                      SizedBox(width: 10),
                                      Text(category), // Text of each category
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
                        onPressed: () {
                          payCheck(context, mobileNumberController,
                              amountController);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kNewAppBarColor),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(color: Colors.white)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20)),
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

  void payCheck(
    BuildContext context,
    TextEditingController mobileController,
    TextEditingController amountController,
  ) {
    String mobileNumber = mobileController.text.trim();
    String amountText = amountController.text.trim();
    int amountInPaisa = int.tryParse(amountText) ?? 0;
    double amountInRupees = amountInPaisa * 100;

    // Perform validation
    if (mobileNumber.isEmpty && amountInPaisa > 0) {
      showValidationErrorDialog(context, 'Please enter mobile number.');
      return;
    } else if (mobileNumber.isEmpty && amountInPaisa <= 0) {
      showValidationErrorDialog(
          context, 'Please enter mobile number and amount.');
      return;
    } else {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        payWithKhaltiApp(
                          context,
                          mobileNumberController,
                          amountController,
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('Pay with Khalti'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        sendToEsewaBackend();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightGreen),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('Pay with Esewa'),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: SendMoney(),
  ));
}
