import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samtry/forgotpassward.dart';
import 'package:samtry/splashscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              routes: {
                '/home': (context) =>  HomePage(),
              },
              
            ),
        designSize: const Size(360, 800));
  }
}

