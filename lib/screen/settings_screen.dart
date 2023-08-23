import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

import '../component/number_row.dart';

class SettingsScreen extends StatefulWidget {
  final int maxnumber;

  const SettingsScreen({super.key, required this.maxnumber});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxnumber = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxnumber=widget.maxnumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0  // 양 옆 패딩
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxnumber: maxnumber,),
              _Footer(
                maxnumber: maxnumber,
                onSliderChanged: onSliderChanged,
                onButtonPressed: onButtonPressed,
              )
            ],
          ),
        ),
      )
    );
  }
  void onSliderChanged(double val){
      setState(() {
        maxnumber = val;
      });
  }
  void onButtonPressed(){
      Navigator.of(context).pop(maxnumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxnumber;

  const _Body({super.key, required this.maxnumber});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: NumberRow(
        number: maxnumber.toInt(),
      )
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final ValueChanged<double>? onSliderChanged;
  final double maxnumber;


  const _Footer({
    super.key,
    this.onSliderChanged,
    required this.maxnumber,
    required this.onButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxnumber,
            min: 1000,
            max: 100000,
            onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
          child: Text('저장 !'),
        ),
      ],
    );
  }
}
