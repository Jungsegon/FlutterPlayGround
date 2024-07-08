import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage +1;

      if(nextPage > 4){
        nextPage =0;
      }

      controller.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 400), // 넘어가는 동안 시간
          curve: Curves.linear  //어떤식으로 애니메이션이 전환되는지 선택
      );
    });
  }

  @override
  void dispose() {
    controller.dispose(); // 스테이트가 사라졌을 때 컨트롤러도 지움 -> 메모리 관리
    if(timer != null){
      timer!.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // 상태바의 색깔을 바꿀수 있음 !
    
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Image.asset('asset/img/image_1.jpeg', fit: BoxFit.cover),
          Image.asset('asset/img/image_2.jpeg', fit: BoxFit.cover),
          Image.asset('asset/img/image_3.jpeg', fit: BoxFit.cover),
          Image.asset('asset/img/image_4.jpeg', fit: BoxFit.cover),
          Image.asset('asset/img/image_5.jpeg', fit: BoxFit.cover)
        ],
      ),
    );
  }
}
