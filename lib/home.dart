import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';
import 'camera.dart';
import 'bandBox.dart';

class Home extends StatefulWidget{
 final  List<CameraDescription> cameras;
  Home(this.cameras);
  @override
  _HomeState createState()=>_HomeState();
}

class _HomeState extends State<Home>{
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  
  setRecognitions(recognitions,imageHeight,imageWidth){
    setState(() {
      _recognitions=recognitions;
      _imageHeight=imageHeight;
      imageWidth=imageWidth;
    });
  }

  loadModel()async{
    String res;
    res= await Tflite.loadModel(
      model:"assets/mobilenet_v1_1.0_224.tflite",
      labels: "assets/mobilenet_v1_1.0_224.txt"
    );
    print(res);
  }

  @override
  void initState(){
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context){
    Size screen=MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(children: <Widget>[
        Camera(
          widget.cameras,
          setRecognitions
        ),
        BandBox(
          _recognitions==null?[]:_recognitions,
          math.max(_imageHeight,_imageWidth),
          math.min(_imageHeight,_imageWidth),
          screen.height,
          screen.width
        )
      ],)
    );
  }
}