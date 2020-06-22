/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 16:12:28
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 16:27:32
 * @FilePath     : \flutter_animations\lib\animated_padding.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPaddingPage extends StatefulWidget {
  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  double _padding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated padding page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedPadding(
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: _padding,
              ),
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                color: Colors.amberAccent,
                child: Center(
                  child: Text('$_padding'),
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _padding = Random().nextDouble() * 80 + 20;
                  });
                },
                child: Text('随机一个水平padding'),
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
