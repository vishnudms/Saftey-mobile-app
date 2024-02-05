
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:samtry/supervisorfilter.dart';
import 'package:samtry/supervisorfinish.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;

class Supervisorreport extends StatefulWidget {    String? Company;
  String? location;
  String? date;
  String? time;
  String? token_id;
  String? Category;
  String? details;
  String? imgpt;
  String? ticket_no;
  String? status;

   Supervisorreport({required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.details,required this.Category,required this.imgpt,required this.ticket_no,required this.status,});



  @override
  State<Supervisorreport> createState() => _SupervisorreportState();
}

class _SupervisorreportState extends State<Supervisorreport> {
  final List<File> _imageList = [];
  bool _isButtonDisabled = false;

  File? _pickedImage;

 Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
        _imageList.add(_pickedImage!);
        _isButtonDisabled = true;
      });
    }
  }

  List<String> items = <String>[
    "Intermediate",
  ];
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
          onPressed: (() {}),
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
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Container(
                height: 320.h,
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.Company}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.location}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.date}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.time}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.token_id}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.Category}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "${widget.details}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled ? null : _takePicture,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonDisabled
                            ? Colors.green
                            : Color(0xff3543c8),
                      ),
                      child: Text(
                        _isButtonDisabled ? "Photo Uploaded" : "Capture Photo",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              child: Image.network("http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",height: 150.h,width:150),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network("http://117.16.136.181/dootedemo/imge/img${widget.imgpt}",height: 50.h,width:50),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_imageList.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Scaffold(
                              appBar: AppBar(),
                              body: Container(
                                child: PhotoView(
                                  imageProvider: FileImage(_imageList[0]),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: _imageList.isNotEmpty
                        ? Image.file(
                            _imageList[0],
                            width: 50.w,
                            height: 50.h,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Container(
                height: 60.h,
                width: 336.w,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24.sp,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 200.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () async{
                   File reimages1 =_imageList[0];
                   List<int> imageBytes1 = reimages1.readAsBytesSync();
                  String base64Image1 = base64Encode(imageBytes1);
                var data1 ={
                  'ticket_no':widget.ticket_no.toString(),
                  'reimage1':base64Image1,
                };
                    var url='http://117.16.136.181/dootedemo/resolveimgup.php';
  var response = await http.post(Uri.parse(url), body: json.encode(data1));
  if (response.statusCode == 200) {
    print(response.body);
    var data =await jsonDecode(response.body);
    
    if (data == "false") {
      Fluttertoast.showToast(
        msg: 'photo not uploaded',
        backgroundColor: Color.fromARGB(255, 181, 36, 7),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      
    } 
    else{
     Fluttertoast.showToast(
        msg: 'photo uploaded Successful',
        backgroundColor: Color.fromARGB(255, 5, 121, 42),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => supervisorfinish(Category: widget.Category, status:widget.status, ticket_no: widget.ticket_no, token_id:widget.token_id,) ,
        ),
      );
    } 

  }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3543c8),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}



















//   class Supervisorreport extends StatefulWidget {
//     String? Company;
//   String? location;
//   String? date;
//   String? time;
//   String? token_id;
//   String? Category;
//   String? details;
//   String? imgpt;
//   String? ticket_no;
//   String? status;

//    Supervisorreport({required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.details,required this.Category,required this.imgpt,required this.ticket_no,required this.status,});


//   @override
//   State<Supervisorreport> createState() => _SupervisorreportState();
// }

// class _SupervisorreportState extends State<Supervisorreport> {
//   String? selectedDate = DateFormat("MM-dd-yyyy").format(DateTime.now());
//   List<String> items = <String>[
//     "Intermediate",
//     "start",
//     "End",
//   ];
//   @override
//   String? dropdownvalue;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
//           icon: const Icon(Icons.arrow_back),
//           onPressed: (() { Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>  supervisorfilter(),
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
//               height: 320.h,
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
//                         Text(
//                           "${widget.details}",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20.h),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.all(40.w),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 200.w,
//                   height: 40.h,
//                   child: ElevatedButton(
//                     onPressed: (() {}),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xff3543c8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                     ),
//                     child: Text(
//                       "Take Picture",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.sp,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20.w),
//                 SizedBox(
//                   height: 50.h,
//                   child: 
//                       Image.network("http://192.168.0.102/dootedemo/imge/img${widget.imgpt}",height: 20.h,width:20)    
//                 )
//               ],
//             ),
//           ),
//           Container(
//               height: 60.h,
//               width: 270.w,
//               decoration: BoxDecoration(
//                 border: Border.all(),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(10.w),
//                 child: DropdownButton<String>(
//                     alignment: Alignment.center,
//                     hint: const Text("Level"),
//                     dropdownColor: Colors.white,
//                     icon: const Icon(Icons.arrow_drop_down),
//                     iconSize: 36,
//                     isExpanded: true,
//                     underline: const SizedBox(),
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 19.sp,
//                         fontWeight: FontWeight.w600),
//                     onChanged: (String? newvalue) {
//                       setState(() {
//                         dropdownvalue = newvalue!;
//                       });
//                     },
//                     value: dropdownvalue,
//                     items: items.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList()),
//               )),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 90.w),
//             child: SizedBox(
//               height: 61.h,
//               width: 267.w,
//               child: ElevatedButton(
//                 onPressed: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => supervisorfinish(Category: widget.Category, status:widget.status, ticket_no: widget.ticket_no, token_id:widget.token_id,)),
//                   )
//                 },
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     elevation: 5.0,
//                     primary: const Color.fromARGB(255, 56, 54, 53),
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
