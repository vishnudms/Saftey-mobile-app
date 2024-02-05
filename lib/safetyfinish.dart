import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samtry/safetymainpage.dart';

class SafetyFinish extends StatefulWidget {
      String? Company;
  String? location;
  String date;
  String? time;
  String? token_id;
  String? Category;
  String? details;
  String? imgpt;
  String? ticket_no;
  String? status;
  String? duedate;
  

   SafetyFinish({required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.details,required this.Category,required this.imgpt,required this.ticket_no,required this.status,required this.duedate,});

  @override
  State<SafetyFinish> createState() => _SafetyFinishState();
}

class _SafetyFinishState extends State<SafetyFinish> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Text(
              "USC",
              style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 63, 62, 62)),
            ),
            Text("Complaint Raised",
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 63, 62, 62))),
            SizedBox(height: 50.h),
            Icon(
              Icons.check_circle,
              color: const Color.fromARGB(255, 50, 204, 33),
              size: 100,
            ),
            SizedBox(height: 40.h),
            Container(
              width: 304.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 107, 106, 106),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Ticket No :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.ticket_no}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Token No :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        SizedBox(
                          width: 140.w,
                          child: Text(
                            "${widget.token_id}",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Category  :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.Category}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Status       :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.status}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Rank          :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.ticket_no}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Date           :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.date}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Due Date   :",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${widget.duedate}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: SizedBox(
                height: 61.h,
                width: 267.w,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SafetMainPage()),
                      (route) => false,
                    ),
                  },
                  child: Text(
                    "Finish",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      primary: Color.fromARGB(255, 50, 204, 33),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r))),
                ),
              ),
            ),
            SizedBox(height: 40.h)
          ],
        ),
      )),
    );
  }
}