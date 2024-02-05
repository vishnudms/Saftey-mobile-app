import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samtry/safetyfilter.dart';
import 'package:samtry/safetyfinish.dart';


class SafetyReport extends StatefulWidget {
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

   SafetyReport({required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.details,required this.Category,required this.imgpt,required this.ticket_no,required this.status,});

  @override
  State<SafetyReport> createState() => _SafetyReportState();
}

class _SafetyReportState extends State<SafetyReport> {
  List<String> items = <String>[
    "Rank A(0-7Days)",
    "Rank B(7-14Days)",
    "Rank C(14-21Days)",
    "Emergency"
  ];
  @override

  String? dropdownvalue;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: SizedBox(
          width: 210.w,
          height: 56.h,
          child: Stack(
            children: [
              const Positioned.fill(
                child: Align(
                  child: SizedBox(
                    width: 210,
                    child: Text(
                      "Unsafe Condition",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 62, 60, 59),
                        fontSize: 24,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 215.w,
                height: 55.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.w,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (() { Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  SafetyFilter(),
        ),
      );}),
          color: Colors.black,
          iconSize: 35,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: Container(
              alignment: Alignment.center,
              height: 60.h,
              width: 200.w,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Text(
                "Report Details",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
                textAlign: TextAlign.center,
              ),
            ), //
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Container(
              height: 510.h,
              width: 336.w,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Company       :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                         '${widget.Company}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Location        :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${widget.location}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Raised Date  :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                         '${widget.date}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Raised Time :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${widget.time}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Token No      :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${widget.token_id}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Category       :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${widget.Category}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "USC Details  :",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '${widget.details}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Image.network("http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",height: 120.h,width: double.infinity,)

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
              height: 60.h,
              width: 270.w,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: DropdownButton<String>(
                    alignment: Alignment.center,
                    hint: Text("Set Rank"),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownvalue = newvalue!;
                      });
                    },
                    value: dropdownvalue,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              )),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 53.h,
                  width: 143.w,
                  child: ElevatedButton(
                    onPressed: (() async {
                      var data1 = {
                        'ticket_no':widget.ticket_no.toString(),
    "rank": dropdownvalue.toString(),
    "sdate":calculateDueDate(widget.date,dropdownvalue.toString()),
    
  };
    var url='http://117.16.136.181/dootedemo/rankset.php';
  var response = await http.post(Uri.parse(url), body: json.encode(data1));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    // String desig = data["desig"];
    print(data);
    if (data == "false") {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'rank not set',
        toastLength: Toast.LENGTH_SHORT,
      ); 
    }   else {
      Fluttertoast.showToast(
        msg: 'rank setting Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SafetyFinish(Category: widget.Category, Company: widget.Company, date: widget.date, details: widget.details, imgpt: widget.imgpt, location: widget.location, ticket_no: widget.ticket_no, time: widget.time, token_id:widget.token_id, status:widget.status, duedate:calculateDueDate(widget.date, dropdownvalue.toString())),
        ),
      );
     
    }
  }
      //                Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => (SafetyFinish()),
      //   ),
      // ); 
                    }),
                    child: Text(
                      "Approve",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: Color.fromARGB(255, 237, 112, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
                SizedBox(
                  height: 53.h,
                  width: 143.w,
                  child: ElevatedButton(
                    onPressed: (() {
                     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => (SafetyFilter()),
        ),
      ); 
                    }),
                    child: Text(
                      "Decline",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 244, 7, 7)),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ],
      )),
    );
  }
}


String calculateDueDate(String givenDate, String rank) {
  final List<String> dateComponents = givenDate.split('-');
  final int day = int.parse(dateComponents[1]);
  final int month = int.parse(dateComponents[0]);
  final int year = int.parse(dateComponents[2]);

  final DateTime date = DateTime(year, month, day);

  DateTime dueDate;

  if (rank == "Rank A(0-7Days)") {
    dueDate = date.add(Duration(days: 7));
  } else if (rank == "Rank B(7-14Days)") {
    dueDate = date.add(Duration(days: 14));
  } else if (rank == "Rank C(14-21Days)") {
    dueDate = date.add(Duration(days: 21));
  } else if (rank == "Emergency") {
    dueDate = date.add(Duration(days: 1));
  } else {
    // Default behavior for any other rank
    dueDate = date.add(Duration(days: 7));
  }

  final DateFormat formattedDateFormat = DateFormat('MM-dd-yyyy');
  final String formattedDueDate = formattedDateFormat.format(dueDate);

  return formattedDueDate;
}