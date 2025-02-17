import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:samtry/mainpage.dart';

class supervisorfinish extends StatefulWidget {
    
  String? token_id;
  String? Category;
  
  String? ticket_no;
    String? status;

   supervisorfinish({required this.token_id,required this.Category,required this.ticket_no,required this.status,});


  @override
  State<supervisorfinish> createState() => _supervisorfinishState();
}

class _supervisorfinishState extends State<supervisorfinish> {
  String? selectedDate = DateFormat("MM-dd-yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Text("Corrective Action Taken",
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
              height: 300.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 145, 145, 145),
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
                         "resolved",
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
                          "${selectedDate}",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: 230.w,
                  child: Text(
                    "Note :",
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 2, 2),
                      fontSize: 17.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 230.w,
                  child: Text(
                    "Your request is in pending,wait for the approval of safety officer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
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
                      MaterialPageRoute(builder: (context) => MainPage()),
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
                      elevation: 5.0, backgroundColor: Color.fromARGB(255, 50, 204, 33),
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