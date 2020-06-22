/*
 * @description  : animated opacity
 * @Author       : k423
 * @Date         : 2020-06-22 15:14:32
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 15:45:01
 * @FilePath     : \flutter_animations\lib\animated_opacity.dart
 */
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated opacity page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Container(
                width: 200,
                color: Colors.amberAccent,
                // 固定宽高比的组件
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Center(child: Text(_opacity.toStringAsFixed(1))),
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    // a%b 求余 a/b 求商 a~/b 求模
                    _opacity = (_opacity + 0.6) % 1;
                  });
                },
                child: Text('切换透明度(步进0.6)'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
