import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranzac/constants.dart';
import 'package:tranzac/constants.dart';


class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

List chartData = [
  [9, 'Household', const Color.fromRGBO(121, 220, 241, 1.0)],
  [15, 'Food', const Color.fromRGBO(71, 154, 161, 1.0)],
  [22, 'Education', const Color.fromRGBO(96, 211, 211, 1.0)],
  [4, 'Transportation', const Color.fromRGBO(148, 214, 224, 1.0)],
  [11, 'Social Life', const Color.fromRGBO(49, 136, 162, 1.0)],
  [9, 'Health', const Color.fromRGBO(14, 209, 238, 1.0)],
  [5, 'Pets', const Color.fromRGBO(14, 89, 101, 1.0)],
  [6, 'Beauty', const Color.fromRGBO(127, 189, 197, 1.0)],
  [9, 'Apparel', const Color.fromRGBO(17, 111, 140, 1.0)],
  [6, 'Electronics and Appliances', const Color.fromRGBO(1, 72, 100, 1.0)],
  [3, 'Others', const Color.fromRGBO(36, 196, 190, 1.0)],
];

class _BudgetState extends State<Budget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<PieChartSectionData> getSections() {
    return chartData.map((data) {
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
        title: const Text(
          'My Expenses',
          style: TextStyle(
            color: kNewAppBarColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet, color: Colors.white),
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
                                'Rs. 4000',
                                style: TextStyle(color: Colors.green, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.money_dollar_circle, color: Colors.white, size: 28),
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
                              Text(
                                'Rs. 18000',
                                style: TextStyle(color: Colors.white, fontSize: 15),
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
            const SizedBox(height: 2), // Space between My Expenses header and TabBar
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
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPieChart(),
                  _buildPieChart(),
                  _buildPieChart(),
                ],
              ),
            ),
            const SizedBox(height: 10), // Space between PieChart and Legend container
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
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: [
                      for (var data in chartData)
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
    return PieChart(
      PieChartData(
        sections: getSections(),
        centerSpaceRadius: 50,
        sectionsSpace: 2,
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            if (event is FlTapUpEvent && pieTouchResponse != null && pieTouchResponse.touchedSection != null) {
              final index = pieTouchResponse.touchedSection!.touchedSectionIndex;
              _onPieChartTapped(index);
            }
          },
        ),
      ),
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
                              const Icon(Icons.filter_list, color: kNewAppBarColor),
                              const SizedBox(width: 8),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: _selectedFilter,
                                  icon: const Icon(Icons.arrow_drop_down, color: kNewAppBarColor),
                                  iconSize: 24,
                                  style: const TextStyle(color: kNewAppBarColor),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedFilter = newValue!;
                                    });
                                  },
                                  items: <String>['Filter', '7 days', '14 days', '30 days']
                                      .map<DropdownMenuItem<String>>((String value) {
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
                                style: TextStyle(fontSize: 15, color: kRedColor),
                              ),
                              Text(
                                'Balance: Rs. 4200',
                                style: TextStyle(fontSize: 15, color: Colors.black),
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
                                style: TextStyle(fontSize: 15, color: kGreenColor),
                              ),
                              Text(
                                'Balance: Rs. 4500',
                                style: TextStyle(fontSize: 15, color: Colors.black),
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
                                style: TextStyle(fontSize: 15, color: kRedColor),
                              ),
                              Text(
                                'Balance: Rs. 4200',
                                style: TextStyle(fontSize: 15, color: Colors.black),
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
                                style: TextStyle(fontSize: 15, color: kGreenColor),
                              ),
                              Text(
                                'Balance: Rs. 4500',
                                style: TextStyle(fontSize: 15, color: Colors.black),
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
