/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 17:48:59
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 18:04:40
 * @FilePath     : \flutter_animations\lib\animated_switcher.dart
 */
import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _current;
  List<Widget> _list = [
    Container(
      key: ValueKey('1'),
      height: 300,
      width: 200,
      color: Colors.redAccent,
    ),
    Container(
      key: ValueKey('2'),
      height: 200,
      width: 300,
      color: Colors.blueAccent,
    )
  ];

  @override
  void initState() {
    _current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated switcher page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: _list[_current],
              // 使用缩放转换
              transitionBuilder: (Widget child, Animation<double> val) {
                return ScaleTransition(scale: val, child: child);
              },
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _current = (_current + 1) % 2;
                  });
                },
                child: Text('切换样式'),
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
