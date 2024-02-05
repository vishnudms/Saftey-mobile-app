import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:samtry/supervisorfilter.dart';
import 'package:samtry/usa.dart';
import 'package:samtry/usc1.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  TextEditingController token_id =TextEditingController();
  List<String> items = <String>[
    "RIL - AD ",
    "RIL  FAD ",
  ];
  String? dropdownvalue;
  List<String> location = <String>[
    "Raw Material Stores",
    "Press Shop",
    "Tool Crib",
    "First Floor Assembly",
    "A - Stores",
    "Ground Floor Assembly",
    "B - Stores",
    "Coil Winding Division",
    "Powder Coating Plant",
    "Spray Paint Section",
    "Raw Material Stores",
    "FG Stores"
  ];
  String? locationvalue;
 
  String? Timevalue =DateFormat('hh:mm:ss a').format(DateTime.now());

   String? selectedDate = DateFormat("MM-dd-yyyy").format(DateTime.now());


  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: _isDrawerOpen ? Icon(Icons.arrow_back) : Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.black,
            iconSize: 35,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/root1.png', height: 45),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_rounded),
            onPressed: (() {}),
            color: Colors.black,
            iconSize: 35,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 112, 55),
              ),
              child: Column(
                children: [
                  Text(
                    'Hi Supervisior',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                    ),
                  ),
                  Image(
                    image: AssetImage("assets/profile.png"),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Logout functionality here
                // For example, you can navigate to the login screen.
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 200.h,
              width: 345.w,
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              padding: EdgeInsets.all(10),
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
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 35.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Image(
                      image: AssetImage("assets/profile.png"),
                    )
                  ]),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      TextButton(
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => supervisorfilter()));
                          }),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bar_chart,
                                size: 35.h,
                              ),
                              Text(
                                "Report",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "IRAC",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Role",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                    height: 50.h,
                    width: 350.w,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 199, 186, 186),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: DropdownButton<String>(
                        hint: Text("Company"),
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
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()))),
            Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                    height: 50.h,
                    width: 350.w,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 199, 186, 186),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: DropdownButton<String>(
                        hint: Text("Location"),
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
                            locationvalue = newvalue!;
                          });
                        },
                        value: locationvalue,
                        items: location
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()))),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 50.h,
                width: 350.w,
                padding: EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 186, 186),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Text(
                  DateFormat("MM-dd-yyyy").format(DateTime.now()),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 50.h,
                width: 350.w,
                padding: EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 186, 186),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Text(
                  DateFormat('hh:mm:ss a').format(DateTime.now()),
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 50.h,
                width: 350.w,
                padding: EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 186, 186),
                    borderRadius: BorderRadius.circular(15.r)),
                child: TextFormField(
                  controller: token_id,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: "Token No",
                    
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
            ),
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
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Usa(Company:dropdownvalue, location: locationvalue, date: selectedDate, time: Timevalue, token_id:token_id.text.toString(),)));
                          print(token_id);
                      }),
                      child: Text(
                        "USA",
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
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Usc1(Company:dropdownvalue, location: locationvalue, date: selectedDate, time: Timevalue, token_id:token_id.text.toString(),)));
                      }),
                      child: Text(
                        "USC",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
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
              height: 30.h,
            )
          ],
        ));
      }),
    );
  }
}

// class _MainPageState extends State<MainPage> {
//   TextEditingController token_id =TextEditingController();
//   List<String> items = <String>[
//     "RIL - AD",
//     "RIL  FAD",
//   ];
//   String _text = '';
// List<String> _suggestions = ['100 - Ram', '100 - Sam'];
//   String? dropdownvalue;
//   List<String> location = <String>[
//     "Raw Material Stores",
//     "Press Shop",
//     "Tool Crib",
//     "First Floor Assembly",
//     "A - Stores",
//     "Ground Floor Assembly",
//     "B - Stores",
//     "Coil Winding Division",
//     "Powder Coating Plant",
//     "Spray Paint Section",
//     "Raw Material Stores",
//     "FG Stores"
//   ];
//   String? locationvalue;
//   // List<String> Time = <String>[
//   //   "9:00 AM",
//   //   "10:00 AM",
//   //   "11:00 AM",
//   // ];
//   String? Timevalue =DateFormat('hh:mm:ss a').format(DateTime.now());

//   String? selectedDate = DateFormat("MM-dd-yyyy").format(DateTime.now());

// bool _isDrawerOpen = false;

//   void _toggleDrawer() {
//     setState(() {
//       _isDrawerOpen = !_isDrawerOpen;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: _isDrawerOpen ? Icon(Icons.arrow_back) : Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//             color: Colors.black,
//             iconSize: 35,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         title: Image.asset('assets/root1.png', height: 45),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notification_add_rounded),
//             onPressed: (() {}),
//             color: Colors.black,
//             iconSize: 35,
//           ),
//         ],
//       ),
//       body: Builder(
//         builder: (context) {
//           return SingleChildScrollView(
//               child: Column(
//             children: [
//               Container(
//                 height: 200.h,
//                 width: 345.w,
//                 margin: EdgeInsets.only(top: 50, left: 20, right: 20),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 107, 106, 106),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Welcome",
//                             style: TextStyle(
//                                 fontSize: 35.sp, fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             "Name",
//                             style: TextStyle(
//                                 fontSize: 25.sp, fontWeight: FontWeight.w600),
//                             textAlign: TextAlign.start,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         width: 30.w,
//                       ),
//                       Image(
//                         image: AssetImage("assets/profile.png"),
//                       )
//                     ]),
//                     SizedBox(height: 10.h),
//                     Row(
//                       children: [
//                         TextButton(
//                             onPressed: (() {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) =>supervisorfilter()));
//                             }),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.bar_chart,
//                                   size: 35.h,
//                                 ),
//                                 Text(
//                                   "Report",
//                                   style: TextStyle(
//                                       fontSize: 16.sp, fontWeight: FontWeight.w600),
//                                 )
//                               ],
//                             )),
//                         SizedBox(
//                           width: 20.w,
//                         ),
//                         Text(
//                           "IRAC",
//                           style: TextStyle(
//                               fontSize: 24.sp, fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           width: 20.w,
//                         ),
//                         Text(
//                           "Role",
//                           style: TextStyle(
//                               fontSize: 24.sp, fontWeight: FontWeight.w600),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.all(15),
//                   child: Container(
//                       height: 50.h,
//                       width: 350.w,
//                       padding: EdgeInsets.only(left: 16, right: 16),
//                       alignment: Alignment.centerLeft,
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 199, 186, 186),
//                           borderRadius: BorderRadius.circular(15.r)),
//                       child: DropdownButton<String>(
//                           hint: Text("Company"),
//                           dropdownColor: Colors.white,
//                           icon: Icon(Icons.arrow_drop_down),
//                           iconSize: 36,
//                           isExpanded: true,
//                           underline: SizedBox(),
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w600),
//                           onChanged: (String? newvalue) {
//                             setState(() {
//                               dropdownvalue = newvalue!;
//                             });
//                           },
//                           value: dropdownvalue,
//                           items:
//                               items.map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList()))),
//               Padding(
//                   padding: EdgeInsets.all(15),
//                   child: Container(
//                       height: 50.h,
//                       width: 350.w,
//                       padding: EdgeInsets.only(left: 16, right: 16),
//                       alignment: Alignment.centerLeft,
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 199, 186, 186),
//                           borderRadius: BorderRadius.circular(15.r)),
//                       child: DropdownButton<String>(
//                           hint: Text("Location"),
//                           dropdownColor: Colors.white,
//                           icon: Icon(Icons.arrow_drop_down),
//                           iconSize: 36,
//                           isExpanded: true,
//                           underline: SizedBox(),
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w600),
//                           onChanged: (String? newvalue) {
//                             setState(() {
//                               locationvalue = newvalue!;
//                             });
//                           },
//                           value: locationvalue,
//                           items: location
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList()))),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Container(
//                   height: 50.h,
//                   width: 350.w,
//                   padding: EdgeInsets.only(left: 16, right: 16),
//                   alignment: Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 199, 186, 186),
//                       borderRadius: BorderRadius.circular(15.r)),
//                   child: Text(
//                     DateFormat("MM-dd-yyyy").format(DateTime.now()),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Container(
//                   height: 50.h,
//                   width: 350.w,
//                   padding: EdgeInsets.only(left: 16, right: 16),
//                   alignment: Alignment.centerLeft,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 199, 186, 186),
//                       borderRadius: BorderRadius.circular(15.r)),
//                   child: Text(
//                     DateFormat('hh:mm:ss a').format(DateTime.now()),
//                     style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               Padding(
//               padding: EdgeInsets.all(15),
//               child: Container(
//                 height: 50.h,
//                 width: 350.w,
//                 padding: EdgeInsets.only(left: 16, right: 16),
//                 alignment: Alignment.centerLeft,
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 199, 186, 186),
//                     borderRadius: BorderRadius.circular(15.r)),
//                 child: TextFormField(
//                   controller: token_id,
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(
//                       fontSize: 19.sp,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                   decoration: InputDecoration(
//                     hintText: "Token No",
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     contentPadding:
//                         EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
//                   ),
//                   onChanged: (value) {
//                     // Update the text state variable
//                     setState(() {
//                       _text = value;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             if (_text.isNotEmpty)
//               Container(
//                 height: 100,
//                 child: ListView.builder(
//                   itemCount: _suggestions.length,
//                   itemBuilder: (context, index) {
//                     final suggestion = _suggestions[index];
//                     if (suggestion.contains(_text)) {
//                       return ListTile(
//                         title: Text(suggestion),
//                         onTap: () {
//                           // Update the text field with the selected suggestion
//                           setState(() {
//                             _text = suggestion;
//                           });
//                         },
//                       );
//                     } else {
//                       return SizedBox.shrink();
//                     }
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(15.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 53.h,
//                       width: 143.w,
//                       child: ElevatedButton(
//                         onPressed: (() {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Usc1(Company:dropdownvalue, location: locationvalue, date: selectedDate, time: Timevalue, token_id:token_id.text.toString(),)));
//                         }),
//                         child: Text(
//                           "USC",
//                           style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 255, 255, 255)),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                             elevation: 5.0,
//                             backgroundColor: Color.fromARGB(255, 237, 112, 55),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.r))),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 53.h,
//                       width: 143.w,
//                       child: ElevatedButton(
//                         onPressed: (() {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Usa(Company:dropdownvalue, location: locationvalue, date: selectedDate, time: Timevalue, token_id:token_id.text.toString(),)));
//                         }),
//                         child: Text(
//                           "USA",
//                           style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 255, 255, 255)),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                             elevation: 5.0,
//                             backgroundColor: Colors.grey,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.r))),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30.h,
//               )
//             ],
//           ));
//         }
//       ),
//     );
//   }
// }