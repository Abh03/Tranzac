import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tranzac/constants.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kActiveIconColor),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Statement",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 220,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(05)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: kActiveIconColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Search")
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_list,
                                        color: kActiveIconColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Filter')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              // padding: EdgeInsets.all(25),
              child: Text(
                'Fri , Mar 29',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                    padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 0),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              // padding: EdgeInsets.all(25),
              child: Text(
                'Thu , Mar 28',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                    padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 0),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
