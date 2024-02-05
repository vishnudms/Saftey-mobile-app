import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samtry/emailverify.dart';
import 'package:samtry/mainpage.dart';
import 'package:samtry/splashscreen.dart';

class ForgotPassword extends StatefulWidget {
  String? token_id;
  ForgotPassword(
      {super.key,
      
      required this.token_id,
      });


  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? rdata;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerify(),
                        ),
                      );
          },
        ),
        elevation: 0,
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70.0),
            Image(
              image: AssetImage("assets/roots logo.png"),
              height: 124.0,
              width: double.infinity,
            ),
            SizedBox(height: 10.0),
            Text(
              "IRAC",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),

          
            Padding(
              padding: EdgeInsets.all(19.0),
              child: Container(
                height: 50.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 199, 186, 186),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  obscureText: !_isPasswordVisible1,
                  controller: newPasswordController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "New Password",
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
            Padding(
              padding: EdgeInsets.all(19.0),
              child: Container(
                height: 50.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 199, 186, 186),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  obscureText: !_isPasswordVisible2,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                        _isPasswordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible2 = !_isPasswordVisible2;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.0),
              child: SizedBox(
                height: 61.0,
                width: 267.0,
                child: ElevatedButton(
                  onPressed: () async {
                    // Check if passwords are empty
                    if (newPasswordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      // Show a toast message for empty passwords
                      Fluttertoast.showToast(
                        msg: "Passwords not entered",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else if (newPasswordController.text ==
                        confirmPasswordController.text) {
                      // Passwords match, you can proceed to the next page
                        var data1 = {
    
                      'email_id': emailController.text.toString(),
                      'newpw': newPasswordController.text.toString(),

                      };
                      var url='http://117.16.136.181/dootedemo/resetpw.php';
                    var response = await http.post(Uri.parse(url), body: json.encode(data1));
                    if (response.statusCode == 200) {
                      print(response.body);
                      var data =await jsonDecode(response.body);
                      print(data);
                      rdata=data;
                      if (data == "False") {
                        Fluttertoast.showToast(
                          msg: 'reset password faild',
                          backgroundColor: Color.fromARGB(255, 181, 36, 7),
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        
                      } 
                      else{
                      Fluttertoast.showToast(
                          msg: 'password has been changed',
                          backgroundColor: Color.fromARGB(255, 5, 121, 42),
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      } 

                    }


                      // Handle password reset logic here
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePage(),
                      //   ),
                      // );
                    } else {
                      // Passwords don't match, show a toast message
                      Fluttertoast.showToast(
                        msg: "Passwords do not match",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    primary: Color.fromARGB(255, 237, 112, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}