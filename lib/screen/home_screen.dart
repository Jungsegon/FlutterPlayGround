import 'package:flutter/cupertino.dart';
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
        body: SafeArea(//safeArea를 사용해 노치를 벗어남
          bottom: false,
          child: Container(
              width: MediaQuery.of(context).size.width, //컨테이너의 위젯이 가운데 정렬
              child: Column( // 이미지를 위아래로 배치할 때 사용
                children: [
                  _TopPart(),
                  _BottomPart()
                ],
              )
          ),
        )
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart({super.key});

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ); // 기본값 = 현재날짜


  @override
  Widget build(BuildContext context) {
    final now =DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ); //현재시간

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'parisienne',
                fontSize: 80// 등록한 글꼴을 바꿀 때 사용
            ),
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize: 30
                ),
              ),
              Text(
                '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize: 20
                ),
              ),
            ],
          ),
          IconButton(
              iconSize: 60.0,
              onPressed: (){
                // 특정 사이즈를 지정했는데 위젯이 전체크기를 차지?
                // 프레임워크가 그 위젯을 어디에다 정렬할지 모르기 때문 !!
                showCupertinoDialog(
                    context: context,
                    barrierDismissible: true, //밖에 터치하면 컨테이너 닫힘 기능
                    builder: (BuildContext context){
                      return Align(
                        alignment: Alignment.bottomCenter, //정렬을 설정
                        child: Container(
                          color: Colors.white,
                          height: 300.0, //정렬을 지정하지 않으면 전체화면 차지
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate,
                            maximumDate: DateTime(
                              now.year,
                              now.month,
                              now.day,
                            ),
                            onDateTimeChanged: (DateTime data){
                              setState(() { //빌드를 다시실행
                                selectedDate = data;
                              });
                            }, // 무조건 들어가야되는 값
                          ),
                        ),
                      );
                    }
                );
                //cupertino ios와 같은 디자인 할 때 부르는 패키지
              },
              icon: Icon(
                  Icons.favorite,
                  color: Colors.red
              )
          ),
          Text(
            'D+${
                DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays+1
            }',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 50,
                fontWeight: FontWeight.w700 // 폰트 두께를 설정
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
