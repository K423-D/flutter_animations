/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 16:32:59
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 17:03:28
 * @FilePath     : \flutter_animations\lib\animated_cross_fade.dart
 */
import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _showSecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated cross fade page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 直接写矩形和圆形转换的时候会有抖动，使用layoutBuilder解决
            // AnimatedCrossFade(
            //   firstChild: Container(
            //     height: 100,
            //     width: 200,
            //     child: Center(
            //       child: Text('first child'),
            //     ),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.rectangle,
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.amberAccent,
            //     ),
            //   ),
            //   secondChild: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.cyan,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Center(
            //       child: Text('second child'),
            //     ),
            //   ),
            //   crossFadeState: _showSecond
            //       ? CrossFadeState.showSecond
            //       : CrossFadeState.showFirst,
            //   duration: Duration(milliseconds: 500),
            //   firstCurve: Curves.linear,
            //   secondCurve: Curves.easeIn,
            //   sizeCurve: Curves.linear,
            // ),
            AnimatedCrossFade(
              layoutBuilder:
                  (Widget firstChild, Key key1, Widget secondChild, Key key2) {
                return Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      child: secondChild,
                      top: 0,
                      bottom: 0,
                      key: key2,
                    ),
                    Positioned(
                      child: firstChild,
                      key: key1,
                    )
                  ],
                );
              },
              firstChild: Container(
                height: 100,
                width: 200,
                child: Center(
                  child: Text('first child'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amberAccent,
                ),
              ),
              secondChild: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('second child'),
                ),
              ),
              crossFadeState: _showSecond
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
              firstCurve: Curves.linear,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.linear,
            ),

            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _showSecond = !_showSecond;
                  });
                },
                child: Text('切换组件',style: TextStyle(color: Colors.white),),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
