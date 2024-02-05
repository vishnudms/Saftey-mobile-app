import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samtry/forgotpassward.dart';
import 'package:samtry/mainpage.dart';
import 'package:samtry/splashscreen.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  TextEditingController emailController = TextEditingController();
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
          onPressed: () async {



 }
        ),
        elevation: 0,
       
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
                  
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "enter email",
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
                       var data1 = {
    
    'email_id': emailController.text.toString(),
    };
    var url='http://117.16.136.181/dootedemo/emailverify.php';
  var response = await http.post(Uri.parse(url), body: json.encode(data1));
  if (response.statusCode == 200) {
    print(response.body);
    var data =await jsonDecode(response.body);
    print(data);
    rdata=data;
    if (data == "False") {
      Fluttertoast.showToast(
        msg: 'invalid email or not exit',
        backgroundColor: Color.fromARGB(255, 181, 36, 7),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      
    } 
    else{
     Fluttertoast.showToast(
        msg: 'email has been verified',
        backgroundColor: Color.fromARGB(255, 5, 121, 42),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  ForgotPassword(token_id: emailController.toString(),),
        ),
      );
    } 

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
        ]),
      ),
    );
  }
}