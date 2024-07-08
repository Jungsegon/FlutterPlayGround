import 'package:flutter/material.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';

import 'screen/home_screen.dart';
import 'screen/route_two_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // home: HomeScreen(),
      // 초기 라우트
      initialRoute: '/',
      // www.google.com -> www.google.com/
      routes: {
        '/' : (context) => HomeScreen(),
        '/one' : (context) => RouteOneScreen(),
        '/two'  :(context) => RouteTwoScreen(),
        '/three' : (context) => RouteThreeScreen()
      },
      debugShowCheckedModeBanner: false,
    )
  );
}
