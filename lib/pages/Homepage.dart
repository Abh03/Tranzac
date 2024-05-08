import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFD7DEE8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(color: Color(0xFF024578)),
            ),
            Positioned(
              top: 80,
              left: 05,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: const Text(
                        'Aavash Lamichhane',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Rs.xxxx',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Available Balance',
                        style:
                            TextStyle(color: Color(0xFF818181), fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF3C6E98),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                      width: 300,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Icon(
                              Icons.access_alarm_rounded,
                              size: 40,
                              color: Color(0xFF526D82),
                            ),
                          ),
                          Text(
                            'Send Money',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Text(
                        'Expenses',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(30),
                            padding: const EdgeInsets.all(20),
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Text(
                                  'Food & Drinks',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 30, // Adjusted width to fit the icon
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF526D82),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      iconSize: 20,
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(),
                          Container(),
                          Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
