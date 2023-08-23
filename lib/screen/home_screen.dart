import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

import '../component/number_row.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(
                onPressed : onSettingsPop,
              ),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(onPressed: onRandomNumberGenerate)
            ],
          ),
        ),
      )
    );
  }
  void onSettingsPop() async{ // async로 값을 받을 수 있음
      // push => List ->add
      final result = await Navigator.of(context).push<int>(
          MaterialPageRoute(builder: (BuildContext context){
            return SettingsScreen(
              maxnumber: maxNumber,
            );
          }
          )
      );

      if(result != null){
        setState(() {
          maxNumber=result;
        });
      }
    }


  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length !=3) {
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
    }

    setState(() {
     randomNumbers=newNumbers.toList();
    });
  }
}


class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w700
          ),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.settings,
              color: RED_COLOR,
            )
        )
      ],
    );
  }
}


class _Body extends StatelessWidget {
  final List<int> randomNumbers;
  const _Body({super.key, required this.randomNumbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            randomNumbers
                .asMap()
                .entries
                .map(
                  (x) =>  Padding(
                padding: EdgeInsets.only(
                    bottom: x.key == 2 ? 0 : 16.0
                ),
                child: NumberRow(
                  number: x.value,
                )
              ),).toList()
        )
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: BLUE_COLOR
        ),
        onPressed: onPressed,
        child: Text('생성하기'),
      ),
    );
  }
}


