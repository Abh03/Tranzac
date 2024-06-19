import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance;
final collref = FirebaseFirestore.instance.collection('Users');
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
  void dispose() {
    _totalBudgetController.dispose();
    _categoryControllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  void _saveChanges() {
    // Implement your save changes logic here

    _categoryControllers.forEach((key, controller) {
      print('$key: ${controller.text}');
    });
    print('Total Budget: ${_totalBudgetController.text}');
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
                              const SizedBox(width: 8),
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  color: kActiveIconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            child: Stack(
                              children: [
                                TextField(
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
                                Positioned(
                                  right: 0,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.arrow_drop_up),
                                        onPressed: () {
                                          setState(() {
                                            int currentValue = int.tryParse(entry.value.text) ?? 0;
                                            entry.value.text = (currentValue + 1).toString();
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onPressed: () {
                                          setState(() {
                                            int currentValue = int.tryParse(entry.value.text) ?? 0;
                                            if (currentValue > 0) {
                                              entry.value.text = (currentValue - 1).toString();
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
