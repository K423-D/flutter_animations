/*
 * @description  : align transition
 * @Author       : k423
 * @Date         : 2020-06-22 14:27:00
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 15:19:54
 * @FilePath     : \flutter_animations\lib\align_transition.dart
 */
import 'package:flutter/material.dart';

class AlignTransitionPage extends StatefulWidget {
  @override
  _AlignTransitionPageState createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  bool _isActived = true;

  @override
  void initState() {
    // 设置动画
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<AlignmentGeometry>(
            begin: Alignment.topRight, end: Alignment.bottomLeft)
        .animate(_controller);
    // 开始动画
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('align transition page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              color: Colors.blueAccent,
              child: AlignTransition(
                alignment: _animation,
                child: Container(
                  width: 25,
                  height: 25,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_isActived) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                    setState(() {
                      _isActived = !_isActived;
                    });
                  },
                  child: Text('改变动画状态'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            )
          ],
        ),
      ),
    );
  }
}
