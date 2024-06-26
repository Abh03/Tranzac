import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/main.dart';
import 'package:tranzac/BudgetTracking/Budget_Edit.dart';

final user = FirebaseAuth.instance;




class Budget extends StatefulWidget {
  const Budget({super.key});


  @override
  State<Budget> createState() => _BudgetState();
}



class _BudgetState extends State<Budget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late String totalBudget;
  late String foodBudget;
  late String educationBudget;
  late String householdBudget;
  late String transportationBudget;
  late String socialLifeBudget;
  late String healthBudget;
  late String petsBudget;
  late String beautyBudget;
  late String apparelBudget;
  late String electronicsBudget;
  late String othersBudget;

  List chartDatas = [];
  Future<Map<String, dynamic>?> get_data() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.currentUser!.email)
        .collection('Budget')
        .doc('BudgetData')
        .get();

    if (document.exists) {
      print(document.data());
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

      if (data != null &&
          data.containsKey('TotalBudget') &&
          data.containsKey('foodBudget') &&
          data.containsKey('educationBudget') &&
          data.containsKey('householdBudget') &&
          data.containsKey('transportationBudget') &&
          data.containsKey('social lifeBudget') && // Note: key with space
          data.containsKey('healthBudget') &&
          data.containsKey('petsBudget') &&
          data.containsKey('beautyBudget') &&
          data.containsKey('apparelBudget') &&
          data.containsKey('electronicsBudget') &&
          data.containsKey('othersBudget')) {

        // Assign values, handling potential empty strings or nulls
        final totalBudget = double.tryParse(data['TotalBudget']) ?? 0.0;
        final foodBudget = double.tryParse(data['foodBudget']) ?? 0.0;
        final educationBudget = double.tryParse(data['educationBudget']) ?? 0.0;
        final householdBudget = double.tryParse(data['householdBudget']) ?? 0.0;
        final transportationBudget = double.tryParse(data['transportationBudget']) ?? 0.0;
        final socialLifeBudget = double.tryParse(data['social lifeBudget']) ?? 0.0; // Note: key with space
        final healthBudget = double.tryParse(data['healthBudget']) ?? 0.0;
        final petsBudget = double.tryParse(data['petsBudget'])?.toString() ?? 0.0; // Convert to string to ensure valid chart data
        final beautyBudget = double.tryParse(data['beautyBudget']) ?? 0.0;
        final apparelBudget = double.tryParse(data['apparelBudget']) ?? 0.0;
        final electronicsBudget = double.tryParse(data['electronicsBudget']) ?? 0.0;
        final othersBudget = double.tryParse(data['othersBudget'])?.toString() ?? "0"; // Convert to string to ensure valid chart data
        chartDatas = [
          [householdBudget, 'Household', const Color.fromRGBO(30, 192, 206, 1.0)],
          [foodBudget, 'Food', const Color.fromRGBO(177, 113, 246, 1.0)],
          [educationBudget, 'Education', const Color.fromRGBO(218, 213, 118, 1.0)],
          [transportationBudget, 'Transportation', const Color.fromRGBO(134, 187, 26, 1.0)],
          [socialLifeBudget, 'Social Life', const Color.fromRGBO(50, 196, 162, 1.0)],
          [healthBudget, 'Health', const Color.fromRGBO(203, 179, 245, 1.0)],
          [petsBudget, 'Pets', const Color.fromRGBO(26, 147, 68, 1.0)],
          [beautyBudget, 'Beauty', const Color.fromRGBO(63, 143, 208, 1.0)],
          [apparelBudget, 'Apparel', const Color.fromRGBO(201, 141, 92, 1.0)],
          [electronicsBudget, 'Electronics', const Color.fromRGBO(203, 120, 142, 1.0)],
          [int.parse(othersBudget), 'Others', const Color.fromRGBO(239, 171, 250, 1.0)],
        ];
        return data;

      } else {
        // Handle case where some expected fields are missing or null
        print('Data fields are missing or null');
        return null;
      }
    }

    // Handle case when document does not exist
    print('Document does not exist');
    return null;
  }







  List chartData = [
    [9, 'Household', const Color.fromRGBO(30, 192, 206, 1.0)],
    [15, 'Food', const Color.fromRGBO(177, 113, 246, 1.0)],
    [22, 'Education', const Color.fromRGBO(218, 213, 118, 1.0)],
    [4, 'Transportation', const Color.fromRGBO(134, 187, 26, 1.0)],
    [11, 'Social Life', const Color.fromRGBO(50, 196, 162, 1.0)],
    [9, 'Health', const Color.fromRGBO(203, 179, 245, 1.0)],
    [5, 'Pets', const Color.fromRGBO(26, 147, 68, 1.0)],
    [6, 'Beauty', const Color.fromRGBO(63, 143, 208, 1.0)],
    [9, 'Apparel', const Color.fromRGBO(201, 141, 92, 1.0)],
    [6, 'Electronics', const Color.fromRGBO(203, 120, 142, 1.0)],
    [3, 'Others', const Color.fromRGBO(239, 171, 250, 1.0)],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    //get_data();
  }

  @override
  void dispose() {
    _tabController.dispose();
    checkBudgetAndNotify();
    super.dispose();
  }

  void checkBudgetAndNotify() {
    // Here make the comparsion and give output
    // if (money_spent > 0.5*budget){
    //   BudgetNotification();

    // }
    if ("apple" == "applerr") {
      BudgetExceedsNotification();
    }
    if ("apple" == "apple") {
      BudgetFinishNotification();
    }

    //  if (money_spent >= budget)
    // {
    //BudgetFinishNotification();
    // }
  }

  Future<void> BudgetExceedsNotification() async {
    try {
      // Android notification details
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'basic_channel',
        'Basic Notifications',
        channelDescription: 'Description of Basic Notifications',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
      );

      // Combine platform-specific details
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      // Show notification
      await flutterLocalNotificationsPlugin.show(
        0,
        'Budget Exceeded!',
        //Change this statement :
        'Your total budget is Rs. 200, which exceeds half of the budget.',
        platformChannelSpecifics,
        payload: 'Budget Exceeded',
      );
    } catch (e) {
      print('Failed to create notification: $e');
    }
  }

  Future<void> BudgetFinishNotification() async {
    try {
      // Android notification details
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'basic_channel',
        'Basic Notifications',
        channelDescription: 'Description of Basic Notifications',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
      );

      // Combine platform-specific details
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      // Show notification
      await flutterLocalNotificationsPlugin.show(
        0,
        'Budget Exceeded!',
        //Change this statement :
        'You have exceeded your budget .',
        platformChannelSpecifics,
        payload: 'Budget Exceeded',
      );
    } catch (e) {
      print('Failed to create notification: $e');
    }
  }

  List<PieChartSectionData> getSections() {
    return chartDatas.map((data) {
      return PieChartSectionData(
        color: data[2],
        value: data[0].toDouble(),
        title: '${data[0]}%',
        titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
        radius: 70,
      );
    }).toList();
  }

  void _onPieChartTapped(int index) {
    if (index < 0 || index >= chartData.length) return;

    final category = chartData[index][1];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Expenses',
              style: TextStyle(
                color: kNewAppBarColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Budget_Edit()),
                ); // Implement edit functionality here
              },
              child: const Text(
                'Edit Budget',
                style: TextStyle(
                  color: kNewAppBarColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kActiveIconColor,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kNewAppBarColor,
                    kGradientChange,
                  ],
                  stops: [0.35, 1],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet,
                              color: Colors.white),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Remaining Budget',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rs. 0',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.money_dollar_circle,
                              color: Colors.white, size: 28),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total Budget',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FutureBuilder<Map<String, dynamic>?>(
                                  future: get_data(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Center(child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(child: Text('Error: ${snapshot.error}'));
                                  } else if (!snapshot.hasData || snapshot.data == null) {
                                    return Center(child: Text('No data available'));
                                  } else {
                                    // Assuming _buildPieChart returns a Widget and you pass the snapshot.data
                                    return Text(
                                               'Rs. ${snapshot.data!['TotalBudget']}',
                                              style: TextStyle(
                                                color: Colors.white, fontSize: 15),
                                                );
                                              }
                                }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 2), // Space between My Expenses header and TabBar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: kNewAppBarColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: kNewAppBarColor,
                tabs: const [
                  Tab(
                    text: 'Weekly',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                  Tab(
                    text: 'Yearly',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5), // Space between TabBar and PieChart
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: FutureBuilder<Map<String, dynamic>?>(
                future: get_data(),
                builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: Text('No data available'));
                  } else {
                    // Assuming _buildPieChart returns a Widget and you pass the snapshot.data
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        _buildPieChart(),
                        _buildPieChart(),
                        _buildPieChart(),
                      ],
                    );
                  }
                },
              ),
            ),
            const SizedBox(
                height: 10), // Space between PieChart and Legend container
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Legend',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kNewAppBarColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<Map<String, dynamic>?>(
                    future: get_data(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return Center(child: Text('No data available'));
                      } else {
                        // Assuming _buildPieChart returns a Widget and you pass the snapshot.data
                        return Wrap(
    spacing: 10,
    runSpacing: 5,
    children: [
    for (var data in chartDatas)
    Row(
    children: [
    Container(
    width: 10,
    height: 10,
    color: data[2],
    ),
    const SizedBox(width: 8),
    Text(
    data[1],
    style: const TextStyle(color: Colors.black),
    ),
    const SizedBox(width: 8),
    Text(
    '${data[0]}%',
    style: const TextStyle(color: Colors.black),
    ),
    ],
    ),
    ],
    );
    }
                    }
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space below Legend container
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return FutureBuilder<Map<String, dynamic>?>(
      future: get_data(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available'));
        } else {
          // Assuming _buildPieChart returns a Widget and you pass the snapshot.data
    return PieChart(
    PieChartData(
    sections: getSections(),
    centerSpaceRadius: 50,
    sectionsSpace: 2,
    pieTouchData: PieTouchData(
    touchCallback: (FlTouchEvent event, pieTouchResponse) {
    if (event is FlTapUpEvent &&
    pieTouchResponse != null &&
    pieTouchResponse.touchedSection != null) {
    final index =
    pieTouchResponse.touchedSection!.touchedSectionIndex;
    _onPieChartTapped(index);
    }
    },
    ),
    ),
    );
    }
      }
    );
  }
}

class DetailPage extends StatefulWidget {
  final String category;

  const DetailPage({super.key, required this.category});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _selectedFilter = 'Filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kNewAppBarColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
        title: Center(child: Text(widget.category)),
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35), // Margin at the top of the page
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kNewAppBarColor,
                    kGradientChange,
                  ],
                  stops: [0.35, 1],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.category,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    Container(
                      width: 122,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButtonHideUnderline(
                          child: Row(
                            children: [
                              const Icon(Icons.filter_list,
                                  color: kNewAppBarColor),
                              const SizedBox(width: 8),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: _selectedFilter,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: kNewAppBarColor),
                                  iconSize: 24,
                                  style:
                                      const TextStyle(color: kNewAppBarColor),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedFilter = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Filter',
                                    '7 days',
                                    '14 days',
                                    '30 days'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: const Text(
                'Fri , Mar 29',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kNewAppBarColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 120,
                          child: Text(
                            'Transferred  to Karib Maharjan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rs.300',
                                style:
                                    TextStyle(fontSize: 15, color: kRedColor),
                              ),
                              Text(
                                'Balance: Rs. 4200',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 2, 8, 0),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 120,
                          child: Text(
                            'Transferred from Nabil Bank Ltd.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rs.2500',
                                style:
                                    TextStyle(fontSize: 15, color: kGreenColor),
                              ),
                              Text(
                                'Balance: Rs. 4500',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: const Text(
                'Thu , Mar 28',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kNewAppBarColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 120,
                          child: Text(
                            'Transferred  to Karib Maharjan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rs.300',
                                style:
                                    TextStyle(fontSize: 15, color: kRedColor),
                              ),
                              Text(
                                'Balance: Rs. 4200',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 2, 8, 0),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 120,
                          child: Text(
                            'Transferred from Nabil Bank Ltd.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rs.2500',
                                style:
                                    TextStyle(fontSize: 15, color: kGreenColor),
                              ),
                              Text(
                                'Balance: Rs. 4500',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Budget(),
  ));
}
