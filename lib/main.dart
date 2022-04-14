import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:opencv/opencv.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Future<void> initState() async {
    const int HFilter = 50;
    const int LFilter = 100;

    ByteData byteImage = await rootBundle.load('assets/images/egg.jpg');
    Uint8List uint8Image = byteImage.buffer.asUint8List();
    Uint8List res = await ImgProc.cvtColor(uint8Image, ImgProc.colorBGR2RGB);
    res = await ImgProc.cvtColor(res, ImgProc.colorRGB2HLS);

    Uint8List maxH = res[:,:,0].max();


    /** TO DO
     seek for get all rows and columns in one dimension in flutter
     python equivalent: maxH = res[:,:,0].max()
     flutter:
        Uint8List maxH = res[:,:,0].max();
        Uint8List maxL = res[:,:,1].max();
        Uint8List notH = res.where(res[:,:,0] < (maxH - HFilter);
        Uint8List notL = res.where(res[:,:,1] < (maxL - LFilter);
        notH = [0,0,0];
        notL = [0,0,0];
        Uint8List ColumnTotals =  res[:,:,0].sum(axis = 0)/res.shape[0];
    **/



  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
