import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({super.key,this.number});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Route 1',
        children: [
          Text(
            'arguments : ${number.toString()}',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: (){
                print(Navigator.of(context).canPop());
              },
              child: Text('Can pop')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).maybePop();
              },
              child: Text('maybepop')
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(456);
            },
            child: Text('pop'),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context)=>RouteTwoScreen(),
                      settings: RouteSettings(
                        arguments: 789,
                      )
                  )
                );
              },
              child: Text('push')
          )
        ]
    );
  }
}
