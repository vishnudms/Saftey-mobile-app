import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:samtry/emailverify.dart';
import 'package:samtry/forgotpassward.dart';
import 'package:samtry/hodmainpage.dart';
import 'package:samtry/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samtry/plantmainpage.dart';
import 'package:samtry/safetymainpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () => Navigator.of(context).pushReplacementNamed('/home'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/roots logo.png'),
              height: 200.h,
              width: 200.w,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
 HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController token_id =TextEditingController();

TextEditingController Password =TextEditingController();

bool _isPasswordVisible1 = false;

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    Map<String, String> data1;

    
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 70.h),
          const Image(
            image: AssetImage("assets/roots logo.png"),
            height: 124,
            width: double.infinity,
          ),
          SizedBox(height: 10.h),
          Text(
            "IRAC",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 186, 186),
                borderRadius: BorderRadius.circular(10..r),
              ),
              child: TextFormField(
                controller: token_id,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 19.sp,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(19.w),
            child: Container(
              height: 50.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 186, 186),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                obscureText: !_isPasswordVisible1,
                  controller: Password,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 15.0,
                      bottom: 15.0,
                      top: 15.0,
                      right: 15.0,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible1 = !_isPasswordVisible1;
                        });
                      },
                    ),
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
                onPressed: () async {
   var data1 = {
    "token_id": token_id.text.toString(),
    "Password": Password.text.toString()
  };
    var url='http://117.16.136.181/dootedemo/login.php';
  var response = await http.post(Uri.parse(url), body: json.encode(data1));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    String desig = data["desig"];
    print(desig);
    if (desig == 'superviser') {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      ); 
    } else if (desig == 'saftymanager') {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SafetMainPage(),
        ),
      ); 
    } else if (desig == 'hod') {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HodMainPage(),
        ),
      ); 
    } else if (desig == 'plantengineer') {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantMainPage(),
        ),
      ); 
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'number is invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  } 
 
  // else {
  //   Fluttertoast.showToast(
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     msg: 'Request failed with status: ${response.statusCode}.',
  //     toastLength: Toast.LENGTH_SHORT,
  //   );
  // }
},
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 5.0, backgroundColor: const Color.fromARGB(255, 237, 112, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r))),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>EmailVerify()));
                },
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 141, 144, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )),
          )
        ],
      )),
    );
  }
}
