import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFD7DEE8),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Color(0xFF3C6E98),
                    size: 30,
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Notifications',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.54,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFF3C6E98),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          "30 March, Saturday, 9:15 AM",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dear Aavash,"),
                              Text(
                                  "You have successfully transferred Rs. 500 to 9748283348.")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          "29 March,  Friday, 9:15 AM",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dear Aavash,"),
                              Text(
                                  "You have successfully transferred Rs. 500 to 9748283348.")
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              "28 March,  Thursday, 9:15 AM",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text("Dear Aavash,"),
                                  Text(
                                      "You have successfully transferred Rs. 500 to 9748283348.")
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
