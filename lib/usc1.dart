import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:samtry/imagepage.dart';
import 'package:samtry/mainpage.dart';

class Usc1 extends StatefulWidget {
  String? Company;
  String? location;
  String? date;
  String? time;
  String? token_id;
  String? Category ='usc';
   Usc1({super.key,required this.Company,required this.location,required this.date,required this.time,required this.token_id,});

  @override
  State<Usc1> createState() => _Usc1State();
}

class _Usc1State extends State<Usc1> {
  String Date1 = DateFormat("MM-dd-yyyy").format(DateTime.now());
  List<String> items = <String>[
    "A - Actuator",
    "B - Big",
    "C - Car",
    "D - Drop",
    "E - Electrical",
    "F - Fire",
    "G - Gillette",
    "H - Health",
    "Other"
  ];
  String? categoryvalue;
  String? Category ='usc';
  TextEditingController _otherTextEditingController = TextEditingController();
   List<String> dropdownOptions = ["Spark in Transformer", "Water leakage","Faliure of model" "Other"];
  String? selectedOption;
  String? otherText;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.notes),
          onPressed: (() {}),
          color: Colors.black,
          iconSize: 35,
        ),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/root1.png', height: 45),
        actions: [
          IconButton(
            icon: const Icon(Icons.perm_contact_cal_sharp),
            onPressed: (() {}),
            color: Colors.black,
            iconSize: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(52.w),
              child: Container(
                height: 63.h,
                width: 256.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  "Unsafe Condition",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange),
                  textAlign: TextAlign.center,
                ),
              ), //
            ),
            Padding(
              padding: EdgeInsets.only(left: 19.w, right: 11.w),
              child: Row(
                children: [
                  Text(
                    "Category         :",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 18.w),
                  Container(
                    width: 180.w,
                    height: 50.h,
                    padding: EdgeInsets.only(left: 30.w, right: 25.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 186, 186),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: DropdownButton<String>(
                        hint: const Text("select"),
                        dropdownColor: const Color.fromARGB(255, 0, 0, 0),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 13.sp,
                        ),
                        onChanged: (String? newvalue) {
                          setState(() {
                            categoryvalue = newvalue!;
                          });
                        },
                        value: categoryvalue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 19.w, right: 11.w),
              child: Row(
                children: [
                  Text(
                    "USC Details    :",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 180.w,
                    padding: EdgeInsets.only(left: 30.w, right: 25.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 186, 186),
                        borderRadius: BorderRadius.circular(10.r)),
                        child: TextFormField(
                controller: _otherTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  hintText: "details..",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                ),
              ),
                 
                  ),
                ],
              ),
            ),
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
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      }),
                      style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: const Color.fromARGB(255, 237, 112, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      child: Text(
                        "<- Back",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 53.h,
                    width: 143.w,
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(Company:widget.Company, location: widget.location, date: Date1, time: widget.time, token_id:widget.token_id,category: Category, selectedOption: categoryvalue, usc_details: _otherTextEditingController.text.toString(),)),
                        );
                      }),
                      style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      child: Text(
                        "Next ->",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
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
