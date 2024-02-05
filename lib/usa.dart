import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:samtry/mainpage.dart';
import 'package:samtry/usaimage.dart';

class Usa extends StatefulWidget {
    String? Company;
  String? location;
  String? date;
  String? time;
  String? token_id;

   Usa({super.key,required this.Company,required this.location,required this.date,required this.time,required this.token_id,});

  @override
  State<Usa> createState() => _UsaState();
}

class _UsaState extends State<Usa> {
  List<String> items = <String>["F-Fire", "R-Repair", "H-Help", "Other"];
  // String? categoryvalue;
  TextEditingController supperviser =TextEditingController();
  List<String> dropdownOptions = [
    "Helmet",
    "Glasses",
    "ID Card",
    "Shoes",

  ];
  String? selectedOption;
  TextEditingController otherText=TextEditingController();
  String Date1 = DateFormat("MM-dd-yyyy").format(DateTime.now());
  String? Category ='usa';
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.token_id);
    _controller..selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
  }
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
          children: [ Padding(
              padding: EdgeInsets.all(52.w),
              child: Container(
                height: 63.h,
                width: 256.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  "Unsafe Act",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange),
                  textAlign: TextAlign.center,
                ),
              ), //
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 19.w, right: 11.w),
              child: Row(
                children: [
                  Text(
                    "Token No        :",
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
                      enabled: false,
                      controller: _controller,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 24, 7, 7),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 19.w, right: 11.w),
              child: Row(
                children: [
                  Text(
                    "Supervisor      :",
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
                      controller: supperviser,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 24, 7, 7),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 19.w, right: 11.w),
              child: Row(
                children: [
                  Text(
                    "USA Details    :",
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
                      value: selectedOption,
                      items: dropdownOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            if (selectedOption == 'Other')
              Padding(
                padding: EdgeInsets.all(20.w),
                child: TextField(
                  controller: otherText,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter other option',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 40.h),
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
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
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
                        print(supperviser.text.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  UsaImage(Company:widget.Company, location: widget.location, date: Date1, time: widget.time, token_id:widget.token_id,category: Category, selectedOption: selectedOption, usc_details: selectedOption, supper_name: supperviser.text.toString(),)),
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
