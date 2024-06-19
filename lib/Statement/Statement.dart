import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;
final transref = FirebaseFirestore.instance
    .collection('Users')
    .doc(user.currentUser!.email)
    .collection('Transactions');

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
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
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Statement",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    Container(
                      width: 103,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButton<String>(
                          value: _selectedFilter,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 22,
                          elevation: 16,
                          style: const TextStyle(color: kNewAppBarColor),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
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
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  if (value == 'Filter')
                                    const Icon(
                                      Icons.filter_list,
                                      color: kNewAppBarColor,
                                    ),
                                  if (value == 'Filter')
                                    const SizedBox(width: 5),
                                  Text(value),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: StreamBuilder(
                    stream: transref.snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                        "${snapshot.data!.docs[index]["Mobile number"]}"),
                                    subtitle: Text(
                                        "${snapshot.data!.docs[index]["Date"]}"),
                                    trailing: Text(
                                        "RS ${snapshot.data!.docs[index]["Total amount"]}"),
                                  ),
                                );
                              }));
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kNewAppBarColor,
                          ),
                        );
                      }
                    })))
            // Container(
            //   margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            //   child: const Text(
            //     'Fri , Mar 29',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: kNewAppBarColor),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.all(20),
            //   width: MediaQuery.of(context).size.width,
            //   height: 130,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20), color: Colors.white),
            //   child: const Column(
            //     children: [
            //       Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 120,
            //               child: Text(
            //                 'Transferred  to Karib Maharjan',
            //                 style: TextStyle(fontSize: 15),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 40,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 150,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Text(
            //                     'Rs.300',
            //                     style: TextStyle(fontSize: 15, color: kRedColor),
            //                   ),
            //                   Text(
            //                     'Balance: Rs. 4200',
            //                     style: TextStyle(
            //                         fontSize: 15, color: Colors.black),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(8.0, 2, 8, 0),
            //         child: Divider(
            //           height: 2,
            //         ),
            //       ),
            //       Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 120,
            //               child: Text(
            //                 'Transferred from Nabil Bank Ltd.',
            //                 style: TextStyle(fontSize: 15),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 40,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 150,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Text(
            //                     'Rs.2500',
            //                     style:
            //                     TextStyle(fontSize: 15, color: kGreenColor),
            //                   ),
            //                   Text(
            //                     'Balance: Rs. 4500',
            //                     style:
            //                     TextStyle(fontSize: 15, color: Colors.black),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            //   child: const Text(
            //     'Thu , Mar 28',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: kNewAppBarColor),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.all(20),
            //   width: MediaQuery.of(context).size.width,
            //   height: 130,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20), color: Colors.white),
            //   child: const Column(
            //     children: [
            //       Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 120,
            //               child: Text(
            //                 'Transferred  to Karib Maharjan',
            //                 style: TextStyle(fontSize: 15),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 40,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 150,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Text(
            //                     'Rs.300',
            //                     style: TextStyle(fontSize: 15, color: kRedColor),
            //                   ),
            //                   Text(
            //                     'Balance: Rs. 4200',
            //                     style: TextStyle(
            //                         fontSize: 15, color: Colors.black),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(8.0, 2, 8, 0),
            //         child: Divider(
            //           height: 2,
            //         ),
            //       ),
            //       Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 120,
            //               child: Text(
            //                 'Transferred from Nabil Bank Ltd.',
            //                 style: TextStyle(fontSize: 15),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 40,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: SizedBox(
            //               width: 150,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Text(
            //                     'Rs.2500',
            //                     style:
            //                     TextStyle(fontSize: 15, color: kGreenColor),
            //                   ),
            //                   Text(
            //                     'Balance: Rs. 4500',
            //                     style:
            //                     TextStyle(fontSize: 15, color: Colors.black),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: Statement(),
//   ));
// }
