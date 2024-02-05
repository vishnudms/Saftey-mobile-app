import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:samtry/plantfilter.dart';

class PlantReport extends StatefulWidget {
  String? Company;
  String? location;
  String? date;
  String? time;
  String? token_id;
  String? Category;
  String? details;
  String? imgpt;
  String? ticket_no;
  String? status;
  String? duedate;

  PlantReport({
    required this.Company,
    required this.location,
    required this.date,
    required this.time,
    required this.token_id,
    required this.details,
    required this.Category,
    required this.imgpt,
    required this.ticket_no,
    required this.status,
    required this.duedate,
  });

  @override
  State<PlantReport> createState() => _PlantReportState();
}

class _PlantReportState extends State<PlantReport> {
  bool _isViewed = false;

  @override
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlantFilter()),
            );
          },
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
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Container(
                height: 700.h,
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
                            "${widget.Company}",
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
                            "${widget.location}",
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
                            "${widget.date}",
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
                            "${widget.time}",
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
                            "Due Date       :",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.duedate}",
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
                            "${widget.token_id}",
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
                            "${widget.Category}",
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
                          SizedBox(
                            width: 140.w,
                            child: Text(
                              "${widget.details}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            "Ticket No      :",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.ticket_no}",
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
                            "Status            :",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.status}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                child: PhotoView(
                                  imageProvider: NetworkImage(
                                    "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                          height: 70.h,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height:20.h),
                       GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                child: PhotoView(
                                  imageProvider: NetworkImage(
                                    "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                          height: 70.h,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height:20.h),
                       GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                child: PhotoView(
                                  imageProvider: NetworkImage(
                                    "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Image.network(
                          "http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",
                          height: 70.h,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: SizedBox(
                height: 61.h,
                width: 267.w,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isViewed = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlantFilter()),
                      );
                    });
                  },
                  child: Text(
                    _isViewed ? "Viewed" : "View",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Color.fromARGB(255, 56, 54, 53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:samtry/plantfilter.dart';

// class PlantReport extends StatefulWidget {
//   String? Company;
//   String? location;
//   String? date;
//   String? time;
//   String? token_id;
//   String? Category;
//   String? details;
//   String? imgpt;
//   String? ticket_no;
//   String? status;
//   String? duedate;

//   PlantReport({required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.details,required this.Category,required this.imgpt,required this.ticket_no,required this.status,required this.duedate,});


//   @override
//   State<PlantReport> createState() => _PlantReportState();
// }

// class _PlantReportState extends State<PlantReport> {
//   bool _isViewed = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         elevation: 0,
//         toolbarHeight: 80,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: SizedBox(
//           width: 210.w,
//           height: 56.h,
//           child: Stack(
//             children: [
//               const Positioned.fill(
//                 child: Align(
//                   child: SizedBox(
//                     width: 210,
//                     child: Text(
//                       "Unsafe Condition",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 62, 60, 59),
//                         fontSize: 24,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 215.w,
//                 height: 55.h,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 1.w,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: (() { Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>  PlantFilter(),
//         ),
//       );}),
//           color: Colors.black,
//           iconSize: 35,
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.w),
//           ),
//           SizedBox(height: 10.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 100.w),
//             child: Container(
//               alignment: Alignment.center,
//               height: 60.h,
//               width: 200.w,
//               decoration: BoxDecoration(
//                 border: Border.all(),
//               ),
//               child: Text(
//                 "Report Details",
//                 style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.orange),
//                 textAlign: TextAlign.center,
//               ),
//             ), //
//           ),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.only(left: 10.w, right: 10.w),
//             child: Container(
//               height: 700.h,
//               width: 336.w,
//               decoration: BoxDecoration(
//                 border: Border.all(),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30.w),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Company       :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.Company}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Location        :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.location}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Raised Date  :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.date}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Raised Time :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.time}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Due Date       :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.duedate}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Token No      :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.token_id}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Category       :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.Category}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "USC Details  :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         SizedBox(
//                           width: 140.w,
//                           child: Text(
//                             "${widget.details}",
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Ticket No      :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.ticket_no}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Status            :",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.orange),
//                         ),
//                         SizedBox(width: 10.w),
//                         Text(
//                           "${widget.status}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
                    
//                      Column(
//                        children: [
//                          ListView(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 Image.network(
//                   "http://10.10.47.136/dootedemo/imge/img${widget.imgpt}",
//                   height: 70.h,
//                   width: double.infinity,
//                 ),
//                 SizedBox(height: 20.h),
//                 Image.network(
//                   "http://10.10.47.136/dootedemo/imge/img${widget.imgpt}",
//                   height: 70.h,
//                   width: double.infinity,
//                 ),
//                 SizedBox(height: 20.h),
//                 Image.network(
//                   "http://10.10.47.136/dootedemo/imge/img${widget.imgpt}",
//                   height: 70.h,
//                   width: double.infinity,
//                 ),
//               ],
//             ),
//                        ],
//                      ),
                    
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 90.w),
//             child: SizedBox(
//               height: 61.h,
//               width: 267.w,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _isViewed = true;
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PlantFilter()),
//                     );
//                   });
//                 },
//                 child: Text(
//                   _isViewed ? "Viewed" : "View",
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     elevation: 5.0,
//                     primary: Color.fromARGB(255, 56, 54, 53),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.r))),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50.h,
//           )
//         ],
//       )),
//     );
//   }
// }
