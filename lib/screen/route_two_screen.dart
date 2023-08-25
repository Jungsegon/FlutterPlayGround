import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    // .of(context) -> 위젯트리에서 가장 가까운 ModalRoute를 가져올 수 있다.
    return MainLayout(
        title: 'Route 2',
        children: [
          Text(
            'arguments: ${arguments}',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('pop'),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/three', arguments: 999);
            },
            child: Text('push Named'),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  // 3로 push후 현재 2를 지움 -> 3에서 pop 1로 이동
                  // 말그대로 replace
                  MaterialPageRoute(builder: (_)=>RouteThreeScreen())
                      // Navigater.of(context).pushReplacementNamed('/three'),
                );
              },
              child: Text('Push Replacement')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (_)=>RouteThreeScreen()
                ),
                    (route) => route.settings.name == '/');
                //홈스크린을 제외한 나머지는 제거
                // true= 다살림, false= 다죽임

                },
              child: Text('pushandremoveuntitl'))
        ]
    );
  }
}
