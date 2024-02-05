import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samtry/usa.dart';
import 'package:samtry/usareport.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<File> _imageList = [];

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageList.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _previewImage(File imageFile) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.file(imageFile),
          actions: [
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  _imageList.remove(imageFile);
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.notes),
          onPressed: (() {}),
          color: Colors.black,
          iconSize: 35,
        ),
        centerTitle: true,
        elevation: 0,
        title: Image.asset('assets/root1.png', height: 45),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: (() {}),
            color: Colors.black,
            iconSize: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.all(52.w),
            child: Container(
              height: 63.h,
              width: 245.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Text(
                "Image",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
                textAlign: TextAlign.center,
              ),
            ), //
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              itemCount: _imageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _previewImage(_imageList[index]),
                  child: GridTile(
                    child: Image.file(
                      _imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _takePicture,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3543c8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Take Picture",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}*/

class UsaImage extends StatefulWidget {
     String? Company;
  String? location;
String? date;
  String? time;
  String? token_id;
  String? category;
  String? supper_name;
  String? selectedOption;
  String? usc_details;


UsaImage({super.key,required this.Company,required this.location,required this.date,required this.time,required this.token_id,required this.category,required this.supper_name,required this.selectedOption,required this.usc_details,});


  @override
  _UsaImageState createState() => _UsaImageState();
}

class _UsaImageState extends State<UsaImage> {
  final List<File> _imageList = [];

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 25);

    if (pickedFile != null) {
      setState(() {
        _imageList.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _previewImage(File imageFile) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.file(imageFile),
          actions: [
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  _imageList.remove(imageFile);
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          title: Image.asset('assets/root1.png', height: 45.h),
          actions: [
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: (() {}),
              color: Colors.black,
              iconSize: 35,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.all(52.w),
              child: Container(
                height: 63.h,
                width: 245.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  "IMAGES",
                  style: TextStyle(
                    color: const Color(0xff717171),
                    fontSize: 26.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ), //
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _imageList.length,
                padding: EdgeInsets.all(30.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 50,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _previewImage(_imageList[index]),
                    child: GridTile(
                      child: Image.file(
                        _imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 250.w,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3543c8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "Take Picture",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80.h,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Usa(Company:widget.Company, location:widget.location, date:widget.date, time:widget.time, token_id:widget.token_id,)),
                              );
                            }),
                            style: ElevatedButton.styleFrom(
                                elevation: 5.0,
                                backgroundColor:
                                    const Color.fromARGB(255, 237, 112, 55),
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
                          width: 30.w,
                        ),
                        SizedBox(
                          height: 53.h,
                          width: 143.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UsaReportPage(Company:widget.Company, location:widget.location, date: widget.date, time: widget.time, token_id:widget.token_id, category: widget.category, selectedOption: widget.selectedOption, usc_details: widget.usc_details,images: _imageList, supervisor_nm:widget.supper_name,),
                                ),
                              );
                            },
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
          ],
        ),
      ),
    );
  }
}
