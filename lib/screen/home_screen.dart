import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // 100~900사이, 기본값 = 500
      body: SafeArea( //safeArea를 사용해 노치를 벗어남
        child: Container(
          width: MediaQuery.of(context).size.width, //컨테이너의 위젯이 가운데 정렬
          child: Column(
            children: [
              Text(
                'U&I',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'parisienne',
                  fontSize: 80// 등록한 글꼴을 바꿀 때 사용
                ),
              ),
              Text(
                  '우리 처음 만난날',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30
                ),
              ),
              Text(
                  '2023-08-17',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 20
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.favorite)
              ),
              Text(
                  'D+1',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 50,
                  fontWeight: FontWeight.w700 // 폰트 두께를 설정
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

