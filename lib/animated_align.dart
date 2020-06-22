/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 15:48:59
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 16:08:02
 * @FilePath     : \flutter_animations\lib\animated_align.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  Alignment _alignment = Alignment.bottomLeft;
  List<Alignment> _list = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated align page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.amberAccent,
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(milliseconds: 500),
                child: IconButton(
                    icon: Icon(
                      Icons.android,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {}),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  int index() => Random().nextInt(9);
                  setState(() {
                    _alignment = _list[index()];
                  });
                },
                child: Text('随机一个align'),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
