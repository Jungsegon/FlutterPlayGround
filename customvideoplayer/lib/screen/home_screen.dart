import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../component/custom_video_player.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video; // null일수 있으므로 ?붙임.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: video == null ? renderEmpty() : renderVideo()
    );
  }

  Widget renderVideo(){
    return Center(
        child: CustomVideoPlayer(
          video: video!,
        onNewVideoPressed: onNewVideoPressed,
      ),
      // 느낌표를 넣으면 null이 될수가 없는 경우를 의미함
    );
  }

  Widget renderEmpty(){
    return Container(
      width: MediaQuery.of(context).size.width, // 전체 너비를 가져옴,
      decoration: getBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(
            onTap: onNewVideoPressed
          ),
          SizedBox(  // 패딩 대신에 사용
            height: 30,
          ),
          _AppName(),
        ],
      ),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
    );
    if(video!=null){
      setState(() {
        this.video=video;
      });
    }
  }

  BoxDecoration getBoxDecoration(){
    return BoxDecoration(
        gradient: LinearGradient( //끝부터끝까지그라데이션, Radial 가운데에서 퍼짐
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2A3A7C),
              Color(0xFF000118)
            ]
        )
    );
  }

}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset('asset/image/logo.png')
    );
  }
}

class _AppName extends StatelessWidget {

  const _AppName({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w300
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('VIDEO',
            style: textStyle
        ),
        Text('PLAYER',
          style: textStyle.copyWith( //copyWith 기존에 있던 글꼴 바꾸기가능
              fontWeight: FontWeight.w700
          ),
        )
      ],
    );
  }
}


