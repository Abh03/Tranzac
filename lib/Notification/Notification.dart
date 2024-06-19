import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tranzac/constants.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
    );

    return Scaffold(
      body: Container(
        color: Color(0xFFD7DEE8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30.sp, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF3C6E98),
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  Text(
                    'Notifications',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kNewAppBarColor,
                      kGradientChange,
                    ],
                    stops: [0.35, 1],
                  ),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildNotificationItem(
                        "30 March, Saturday, 9:15 AM",
                        "You have successfully transferred Rs. 500 to 9748283348.",
                      ),
                      buildNotificationItem(
                        "30 March, Saturday, 9:15 AM",
                        "You have successfully transferred Rs. 500 to 9748283348.",
                      ),
                      buildNotificationItem(
                        "29 March, Friday, 9:15 AM",
                        "You have successfully transferred Rs. 500 to 9748283348.",
                      ),
                      buildNotificationItem(
                        "28 March, Thursday, 9:15 AM",
                        "You have successfully transferred Rs. 500 to 9748283348.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem(String date, String message) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(10.w),
            width: 300.w, // Example width using screen_utils
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dear Aavash,",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
