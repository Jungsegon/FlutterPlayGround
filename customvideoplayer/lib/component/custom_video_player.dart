import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;

  const CustomVideoPlayer({
    super.key, required this.video,
    required this.onNewVideoPressed});


  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  Duration currentPosition = Duration();
  VideoPlayerController? videoController;
  bool showControls = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilaizeController();
  }
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget.video.path != widget.video.path){
      initilaizeController();
    }
  }

  initilaizeController() async {
    currentPosition = Duration();
    videoController=VideoPlayerController.file(
      // file:io패키지를 불러야함!!
        File(widget.video.path)
    );

    await videoController!.initialize();

    videoController!.addListener(() {//addlistener는 값이 변경이 될때마다 실행이 됨
      final currentPosition = videoController!.value.position;
    });
    setState(() {
      this.currentPosition=currentPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(videoController ==null){
      return CircularProgressIndicator(); //로딩바
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          showControls=!showControls;
        });
      },
      child: AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              videoController!,
            ),
            if(showControls)
              _Controls(
                onReversePressed: onReversePressed,
                onPlayPressed: onPlayPressed,
                onForwardPressd: onForwardPressed,
                isPlaying: videoController!.value.isPlaying,
             ),
            if(showControls)
              _NewVideo(
                  onPressed: widget.onNewVideoPressed
              ),
            _SliderBottom(
                currentPosition: currentPosition,
                maxPosition: videoController!.value.duration,
                onSliderChanged: onSliderChanged
            )
          ],
        ),
      ),
    );
  }

  void onSliderChanged(double val){
    videoController!.seekTo(
      Duration(
        seconds: val.toInt()
      )
    );
  }



  void onReversePressed(){
    final currentPosition = videoController!.value.position;

    Duration position = Duration(); // 기본 위치 0으로 지정

    if(currentPosition.inSeconds>3) {  // 3초보다 커야 3초앞으로 이동가능
      Duration position = currentPosition - Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }
  void onPlayPressed(){
    // 이미 실행중이면 중지
    // 실행중이 아니면 실행
    setState(() {
      if(videoController!.value.isPlaying){
        videoController!.pause();
      }else{
        videoController!.play();
      }
    });
  }
  void onForwardPressed(){
    final maxPosition = videoController!.value.duration; //동영상 전체길이
    final currentPosition = videoController!.value.position;

    Duration position = maxPosition; // 기본 위치 0으로 지정

    if((maxPosition - Duration(seconds: 3)).inSeconds
        > currentPosition.inSeconds) {
      // 전체 길이에서 3초뺀길이가 현재포지션 보다 길다면
      Duration position = currentPosition + Duration(seconds: 3);
    }
    videoController!.seekTo(position);
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressd;
  final bool isPlaying;
  const _Controls({
    super.key,
    required this.onPlayPressed,
    required this.onReversePressed,
    required this.onForwardPressd,
    required this.isPlaying
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(0.5),
      // 버튼이 나타날 때 약간의 어두운 느낌 적용
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(onPressed: onReversePressed,
              iconData: Icons.rotate_left
          ),
          renderIconButton(onPressed: onPlayPressed,
              iconData: isPlaying? Icons.pause : Icons.play_arrow
          ),
          renderIconButton(onPressed: onForwardPressd,
              iconData: Icons.rotate_right
          )
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
}){
    return IconButton(
        onPressed: onPressed,
        iconSize: 30,
        color: Colors.white,
        icon: Icon(iconData),
    );
  }

}

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _NewVideo({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned( //위치를 지정하는 위젯
      right: 0,
      child: IconButton(
          onPressed: onPressed,
          color: Colors.white,
          iconSize: 30,
          icon: Icon(
              Icons.photo_camera_back
          )
      ),
    );
  }
}

class _SliderBottom extends StatelessWidget {
  final Duration currentPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged;

  const _SliderBottom({super.key, required this.currentPosition,
    required this.maxPosition,
    required this.onSliderChanged});

  @override
  Widget build(BuildContext context) {
    return           Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10
        ),
        child: Row(
          children: [
            Text(
              '${currentPosition.inMinutes}:'
                  '${(currentPosition.inSeconds%60).toString().padLeft(2,'0')}',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            Expanded(
              child: Slider(
                  max: maxPosition.inSeconds.toDouble(),
                  min: 0,
                  value: currentPosition.inSeconds.toDouble(),
                  onChanged: onSliderChanged
              ),
            ),
            Text(
              '${maxPosition.inMinutes}:'
                  '${(maxPosition.inSeconds%60)
                  .toString().padLeft(2,'0')}',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}




