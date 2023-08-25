import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // route 2 로부터 argument를 받음
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
        title: 'Route 3',
        children: [
          Text('argument : ${argument}',
          textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('pop')
          )
        ]
    );
  }
}
