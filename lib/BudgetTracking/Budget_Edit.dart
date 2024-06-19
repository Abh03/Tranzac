import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/BudgetTracking/Budget.dart';
import 'package:tranzac/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance;
final budgetref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Budget');

class Budget_Edit extends StatefulWidget {
  const Budget_Edit({super.key});

  @override
  State<Budget_Edit> createState() => _Budget_EditState();
}

class _Budget_EditState extends State<Budget_Edit> {
  final TextEditingController _totalBudgetController = TextEditingController();
  final Map<String, TextEditingController> _categoryControllers = {
    'Food': TextEditingController(),
    'Household': TextEditingController(),
    'Education': TextEditingController(),
    'Transportation': TextEditingController(),
    'Social Life': TextEditingController(),
    'Health': TextEditingController(),
    'Pets': TextEditingController(),
    'Beauty': TextEditingController(),
    'Apparel': TextEditingController(),
    'Electronics': TextEditingController(),
    'Others': TextEditingController(),
  };

  final Map<String, IconData> _categoryIcons = {
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
  @override
  void dispose() {
    _totalBudgetController.dispose();
    _categoryControllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }
  // _categoryControllers.forEach((key, controller) {
  // print('$key: ${controller.text}');

  void _saveChanges() {
    // Collect all the category data into a single map
    Map<String, String> categoryData = {};
    _categoryControllers.forEach((key, controller) {
      categoryData[key] = controller.text;
    });

    // Create the document data including total budget and category allocations
    Map<String, dynamic> budgetData = {
      'TotalBudget': _totalBudgetController.text,
      'CategoryBudgets': categoryData,
    };

    // Save the data to Firestore in a single document
    budgetref.doc('BudgetData').set(budgetData).then((_) {
      // Navigate to the Budget page after successful save
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Budget()),
            (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      // Handle any errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save budget data: $error'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNewAppBarColor,
        elevation: 0,
        title: const Text(
          'Edit Budget',
          style: TextStyle(
            color: kActiveIconColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Budget',
                style: TextStyle(
                  color: kNewAppBarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _totalBudgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your total budget',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Set your budget allocation for each category in percentage.',
                style: TextStyle(
                  color: kNewAppBarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Column(
                children: _categoryControllers.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: kNewAppBarColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _categoryIcons[entry.key], // Use dynamic icon
                                color: kNewAppBarColor,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  color: kNewAppBarColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              controller: entry.value,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '0%',
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: (value) {
                                // Implement onChanged if needed
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kActiveIconColor),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
