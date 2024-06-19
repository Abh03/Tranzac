import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';


class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {



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
    'Electronics',
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
    'Electronics': Icons.phone_android,
    'Others': Icons.category,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgroundColor,
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
                  'Add Expense',
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
            child: SingleChildScrollView(
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
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Amount You Paid',
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
                                        const SizedBox(width: 10),
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
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kNewAppBarColor,
                            textStyle: const TextStyle(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
