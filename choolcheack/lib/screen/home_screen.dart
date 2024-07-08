import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // latitude - 위도
  // longitube - 경도
  // 구글맵스에서 가져온 클래스
  static final LatLng companyLatLng = LatLng(
      41.38111, 2.12281  // 바르셀로나 홈구장 CampNou
  );
  // 카메라 구도
  static final CameraPosition initialPosition = CameraPosition(
      target: companyLatLng,
    zoom: 15  //10~20이 적당
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Column(
        children: [
          _CustomGoogleMap(initialPosition: initialPosition),
          _ChoolCheckButton(),
        ],
      ),
    );
  }

  AppBar renderAppBar(){
    return AppBar(
      centerTitle: true,
      title: Text(
        '지도',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  const _CustomGoogleMap({super.key, required this.initialPosition});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal, //맵타입 많음 !
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  const _ChoolCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        '출근',
      ),
    );
  }
}

