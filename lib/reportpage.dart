import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:samtry/tokenpage.dart';

class ReportPage extends StatefulWidget {
  final List<File> images;
  String? Company;
  String? location;
  String? date;
  String? time;
  String? token_id;
  String? selectedOption;
  String? usc_details;
  String? category;
  ReportPage(
      {super.key,
      required this.Company,
      required this.location,
      required this.date,
      required this.time,
      required this.token_id,
      required this.category,
      required this.selectedOption,
      required this.usc_details,
      required this.images});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? Category;
String? tic;
  @override
  void initState() {
    Category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: SizedBox(
          width: 210,
          height: 56,
          child: Stack(
            children: [
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 210,
                    child: Text(
                      "Preview Report",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfff48732),
                        fontSize: 24,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 211,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Expanded(
              child: GridView.builder(
                itemCount: widget.images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Image.file(
                      widget.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 320,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Company       :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.Company}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Location        :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.location}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Raised Date  :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.date}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Raised Time :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.time}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Token No      :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.token_id}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Category       :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.category}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "USC Details  :",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${widget.usc_details}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 240,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                          File images1 = widget.images[0];
    File images2 = widget.images[1];
    File images3 = widget.images[2];
    List<int> imageBytes1 = images1.readAsBytesSync();
String base64Image1 = base64Encode(imageBytes1);
List<int> imageBytes2 = images2.readAsBytesSync();
String base64Image2 = base64Encode(imageBytes2);
List<int> imageBytes3 = images3.readAsBytesSync();
String base64Image3 = base64Encode(imageBytes3);
                          var data1 = {
    
    'company': widget.Company.toString(),
    'location': widget.location.toString(),
    'date':widget.date.toString(),
    'time':widget.time.toString(),
    'token_id':widget.token_id.toString(),
    'date':widget.date.toString(),
    'category': widget.category.toString(),
    'option':widget.selectedOption.toString(),
    'details':widget.usc_details.toString(),
    'image1':base64Image1,
    'image2':base64Image2 ,
    'image3':base64Image3,
    

  };
    var url='http://117.16.136.181/dootedemo/uplodeimg.php';
  var response = await http.post(Uri.parse(url), body: json.encode(data1));
  if (response.statusCode == 200) {
    print(response.body);
    var data =await jsonDecode(response.body);
    print(data);
    tic=data;
    if (data == "false") {
      Fluttertoast.showToast(
        msg: 'complient not registered',
        backgroundColor: Color.fromARGB(255, 181, 36, 7),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      
    } 
    else{
     Fluttertoast.showToast(
        msg: 'complient registered Successful',
        backgroundColor: Color.fromARGB(255, 5, 121, 42),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  TokenPage(ticket_no: tic,),
        ),
      );
    } 

  }
                      
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color.fromARGB(255, 243, 140, 44),
                      padding: const EdgeInsets.fromLTRB(39, 16, 42, 11),
                      elevation: 4,
                    ),
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//   Future<void> postData() async {
// //     File images1 = widget.images[0];
// //     File images2 = widget.images[1];
// //     File images3 = widget.images[2];
// //     List<int> imageBytes1 = images1.readAsBytesSync();
// // String base64Image1 = base64Encode(imageBytes1);
// // List<int> imageBytes2 = images2.readAsBytesSync();
// // String base64Image2 = base64Encode(imageBytes2);
// // List<int> imageBytes3 = images3.readAsBytesSync();
// // String base64Image3 = base64Encode(imageBytes3);
//      var data1 = {
    
//     'company': widget.Company,
//     'location': widget.location,
//     'date':widget.date,
//     'time':widget.time,
//     'token_id':widget.token_id,
//     'date':widget.date,
//     'category': widget.category,
//     'option':widget.selectedOption,
//     'details':widget.usc_details,
//     // 'image1':base64Image1,
//     // 'image2':base64Image2 ,
//     // 'image3':base64Image3,
    

//   };
//     var url='http://10.10.47.136/rootedemo/uplodeimg.php';
//   var response = await http.post(Uri.parse(url), body: json.encode(data1));
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     if (data == true) {
//       Fluttertoast.showToast(
//         msg: 'complient registered Successful',
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const TokenPage(),
//         ),
//       );
//     } 
//     // var url = 'http://10.10.47.136/rootedemo/store.php';
//     // var response = await http.post(Uri.parse(url), body: {
//     //   'company': widget.Company!,
//     //   'location': widget.location!,
//     //   'category': widget.category!,
//     //   'images': widget.images.map((image) => image.path).toString(),
//     // });

//     // print(response.body); // prints the response body for debugging purposes
//   }
// }


