import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nonname/config/palette.dart';
import 'package:nonname/screens/conversations_screen.dart';
import 'package:nonname/screens/error_screen.dart';
import 'package:nonname/screens/home_screen.dart';
import 'package:nonname/screens/login_screen.dart';
import 'package:nonname/screens/search_screen.dart';
import 'package:nonname/screens/success_screen.dart';
import 'package:nonname/screens/user_information_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Montserrat Light",
            backgroundColor: mobileBackgroundColor,
            textTheme: TextTheme(
              button: TextStyle(fontSize: 18.sp, color: Colors.white),
              headline1: TextStyle(
                fontSize: 18.sp,
                color: whiteColor,
                fontFamily: "Montserrat Medium",
              ),
              headline2: TextStyle(fontSize: 11.sp, color: primaryTextColor),
              bodyText1: TextStyle(
                  fontSize: 13.sp,
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  fontSize: 13.sp,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          home: const ConversationScreen(),
        );
      },
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
    );
  }
}
