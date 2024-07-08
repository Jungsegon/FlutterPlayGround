import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        // 작업실행
        final canPop = Navigator.of(context).canPop();
        //canpop 할수 있는 상태면 true 아니면 false
          return canPop;
        },
      child: MainLayout(
          title: 'HomeScreen',
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).canPop();
                },
                child: Text('Can pop')
            ),
            ElevatedButton(
              //스택에 페이지가 홈스크린 뿐일 때 maybepop을 사용하면 뒤로가기 불가능
                onPressed: (){
                  Navigator.of(context).maybePop();
                },
                child: Text('maybepop')
            ),

            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('pop')
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>RouteOneScreen(
                            number: 123,
                          )
                      )
                  );
                  print(result);
                },
                child: Text('push')
            )
          ]
      ),
    );
  }
}
