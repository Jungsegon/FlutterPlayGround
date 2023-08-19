import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
    runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'sunflower',
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white,
                fontFamily: 'parisienne',
                fontSize: 80// 등록한 글꼴을 바꿀 때 사용
            ),
            headline2: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w700 // 폰트 두께를 설정
            ),
            bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 30
            ),
            bodyText2: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          )
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      )
    );
}