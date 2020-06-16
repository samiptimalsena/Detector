import 'package:flutter/material.dart';

class BandBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  BandBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW);

  @override
  Widget build(BuildContext context) {
    var ht=MediaQuery.of(context).size.height;
    List<Widget> _renderStrings() {
      double offset = -10;
      return results.map((re) {
        offset = offset + 14;
        return Positioned(
          left: 10,
          top: offset,
          width: screenW,
          height: screenH,
          child: Text(
            "${re["label"]} ${(re["confidence"] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList();
    }

    return Container(
      margin: EdgeInsets.only(top:ht-50),
      child: Stack(
        children:  _renderStrings()
            
      ),
    );
  }
}