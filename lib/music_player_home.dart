import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

import 'common/custom_slider_track.dart';

class MusicPlayerHome extends StatefulWidget {
  @override
  _MusicPlayerHomeState createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141417),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 14.0, right: 12.0),
          child: SvgPicture.asset(
            'assets/Rectangle 13.svg',
            color: Colors.grey,
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          'PLAYING NOW',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/search.svg',
              color: Colors.grey,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      bottomSheet: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color:Color(0xff2c2c38) ,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(150.0),),
        ),
        child: Center(
          child: Icon(Icons.keyboard_arrow_up_sharp,size: 40.0, color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff24242E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150.0),
                topRight: Radius.circular(8.0),
              )),
          child: Column(
            children: [
              MusicWall(),
              Text(
                'In-THe-EnD(128K)',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'unknown Artist)',
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontSize: 16.0),
              ),
              SizedBox(height: 10.0,),
              MusicMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicWall extends StatefulWidget {
  const MusicWall({Key? key}) : super(key: key);

  @override
  _MusicWallState createState() => _MusicWallState();
}

class _MusicWallState extends State<MusicWall> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            height: 300.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff0346ff),
                      Color(0xffA204FF),
                    ])),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/Music.svg',
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, top: 20.0, bottom: 20.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/Music.svg',
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SvgPicture.asset(
                          'assets/Music.svg',
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 350.0,
                // width: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      'assets/153-1533400_female-singer-png-png-download-singer-pngf-transparent2.png'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 25.0,
          left: 50.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ROCK',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 3.0,
                      fontSize: 35.0),
                ),
                Text(
                  'MUSIC',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 5.0,
                      fontSize: 40.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MusicMenu extends StatefulWidget {
  const MusicMenu({Key? key}) : super(key: key);

  @override
  _MusicMenuState createState() => _MusicMenuState();
}

class _MusicMenuState extends State<MusicMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/love 1.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                SvgPicture.asset(
                  'assets/bell.svg',
                  height: 20.0,
                  width: 20.0,
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            MusicSlider(),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/shuffle.svg',
                  height: 20.0,
                  width: 20.0,
                ),
                Icon(Icons.fast_rewind, size: 30.0,color: Colors.grey,),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                     shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff0346ff),
                            Color(0xffA204FF),
                          ])),
                  child: Icon(Icons.play_arrow,size: 30.0,color: Colors.white,),
                ),
                Icon(Icons.fast_forward, size: 30.0,color: Colors.grey,),
                SvgPicture.asset(
                  'assets/music list.svg',
                  height: 20.0,
                  width: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class MusicSlider extends StatefulWidget {
  const MusicSlider({Key? key}) : super(key: key);

  @override
  _MusicSliderState createState() => _MusicSliderState();
}

class _MusicSliderState extends State<MusicSlider> {
  double val=10.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderThemeData(
          trackShape: GradientRectSliderTrackShape(
            gradient: gradient,
            darkenInactive: true,
          )
        ), child: Slider(
        min: 0,
        max: 100,
        onChanged: (value){
          setState(() {
            val=value;
          });
        }, value: val,
      ),
      ),
    );
  }
}



