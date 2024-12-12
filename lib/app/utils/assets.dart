import 'package:flutter/material.dart';

const linkAsset = 'assets/';

class AssetsCustom {
    static String getLinkImg(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const String api_token = '09644fdd55b08c97122d85d748fc34db';
}

Widget createTemp (num temp, {double size = 100}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         temp.toString(),
          style: TextStyle(
              fontSize: size, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          '0',
          style: TextStyle(
              fontSize: size/3, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
}