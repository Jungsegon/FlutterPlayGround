import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버튼'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                // Material State
                // hovered - 호버링 상태 (마우스 커서를 올려놓은 상태)
                // focused - 포커스 됐을 때 (텍스트 필드)
                // pressed - 눌렸을 때 (o)
                // dragged - 드레그 됐을 때
                // selected - 선택됐을 때 (체크박스, 라디오 버튼)
                // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을 때
                // disabled - 비활성화 됐을 때 (o)
                // error - 에러상태
                // MaterialStateProperty.All() -> 어느 상태든 일관된 색을 유지
                // resolveWith -> 상태에 따라 !!
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states){
                        if(states.contains(MaterialState.pressed)){
                          return Colors.green;
                        }
                        return Colors.black;
                      }
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states){
                        if(states.contains(MaterialState.pressed)){
                          return Colors.white;
                        }
                        return Colors.red;
                      }
                  ),
                padding: MaterialStateProperty.resolveWith((states){
                  if(states.contains(MaterialState.pressed)){
                    return EdgeInsets.all(100);
                  }
                  return EdgeInsets.all(20);
                })
              ),
              child: Text(
                  'ButtonStyle'
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                // ElevatedButton으로 style 할 수 있는 요소
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  //글자 색과 애니메이션
                  backgroundColor: Colors.red,
                  // 버튼의 배경색
                  shadowColor: Colors.green,
                  // 그림자 색깔
                  elevation: 10,
                  // 그림자 크기 조절 -> 입체감
                  textStyle:
                  TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  padding: EdgeInsets.all(32),
                  side: BorderSide(
                    //테두리
                    color: Colors.black, // 테두리 색
                    width: 4, // 테두리 두께
                  ),
                ),
                child: Text('ElevatedButton')),
            OutlinedButton(
                onPressed: () {},
                // OutlinedButton으로 style 할 수 있는 요소
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green, // 글자와 애니메이션 색
                  backgroundColor: Colors.yellow, // 배경색
                  elevation: 10, // 그림자
                ),
                child: Text('OutLinedButton')),
            TextButton(
                onPressed: () {},
                // TextButton으로 style 할 수 있는 요소
                style: TextButton.styleFrom(
                  foregroundColor: Colors.brown, //글자색과 애니메이션 색
                  backgroundColor: Colors.blue, // 배경색
                  elevation: 20, //그림자
                ),
                child: Text('TextButton'))
          ],
        ),
      ),
    );
  }
}
