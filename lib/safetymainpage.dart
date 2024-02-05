import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'safetyfilter.dart';


class SafetMainPage extends StatefulWidget {
  const SafetMainPage({super.key});

  @override
  State<SafetMainPage> createState() => _SafetMainPageState();
}

class _SafetMainPageState extends State<SafetMainPage> {
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
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180.h,
                  width: 345.w,
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 107, 106, 106),
                    borderRadius: BorderRadius.circular(15),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "IRAC",
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Safety Officer",
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 132.h,
                    width: 156.w,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SafetyFilter()),
                        )
                      },
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart,
                            size: 40.h,
                          ),
                          SizedBox(
                            width: 140.w,
                            child: Text(
                              "Report For Safety Officer",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                      style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          primary: Color.fromARGB(255, 237, 112, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r))),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
