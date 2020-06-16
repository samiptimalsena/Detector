import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'home.dart';

List<CameraDescription> cameras;

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    cameras=await availableCameras();
  }on CameraException catch(exc){
    print(exc);
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Detector",
      home:Home(cameras))
  );
}