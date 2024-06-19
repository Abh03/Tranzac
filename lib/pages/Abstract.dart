import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranzac/BudgetTracking/budget.dart';
import 'package:tranzac/Notification/Notification.dart';
import 'package:tranzac/Profile/profile.dart';
import 'package:tranzac/Settings/Settings.dart';
import 'package:tranzac/Splitwise/Split.dart';
import 'package:tranzac/Statement/Statement.dart';
import 'package:tranzac/pages/Homepage.dart';
import 'package:tranzac/pages/QR.dart';
import 'package:tranzac/constants.dart';

final user = FirebaseAuth.instance;

class Abstract extends StatefulWidget {
  const Abstract({super.key});

  @override
  State<Abstract> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Abstract> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const Statement(),
    const QR(),
    const Budget(),
    const Splitwise(),
  ];
  final PageStorageBucket pgB = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffd7dee8),
      appBar: AppBar(
        backgroundColor: kNewAppBarColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Profile())));
          },
          icon: const Icon(
            Icons.person_4_outlined,
            color: Colors.white,
          ),
          selectedIcon: const Icon(
            Icons.person_4,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Hello,${user.currentUser!.email}",
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Notify())));
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Settings())));
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: PageStorage(bucket: pgB, child: currentScreen),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kNewAppBarColor,
          child: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white70,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => const QR())));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kNewAppBarColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 9,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const HomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home,
                              color: currentTab == 0
                                  ? Colors.white
                                  : Colors.white70),
                          Text("Home",
                              style: TextStyle(
                                  color: currentTab == 0
                                      ? Colors.white
                                      : Colors.white70))
                        ],
                      )),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Statement();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sticky_note_2,
                              color: currentTab == 1
                                  ? Colors.white
                                  : Colors.white70),
                          Text("Statement",
                              style: TextStyle(
                                  color: currentTab == 1
                                      ? Colors.white
                                      : Colors.white70))
                        ],
                      )),
                  const SizedBox(height: 50, width: 40),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Budget();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wallet,
                              color: currentTab == 2
                                  ? Colors.white
                                  : Colors.white70),
                          Text("Budget",
                              style: TextStyle(
                                  color: currentTab == 2
                                      ? Colors.white
                                      : Colors.white70))
                        ],
                      )),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Splitwise();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.vertical_split,
                              color: currentTab == 3
                                  ? Colors.white
                                  : Colors.white70),
                          Text("Split",
                              style: TextStyle(
                                  color: currentTab == 3
                                      ? Colors.white
                                      : Colors.white70))
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
