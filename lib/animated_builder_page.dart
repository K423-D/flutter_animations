/*
 * @description  : animated builder
 * @Author       : k423
 * @Date         : 2020-06-22 09:59:43
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 15:11:33
 * @FilePath     : \flutter_animations\lib\animated_builder_page.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  // 定义动画控制器
  AnimationController _controller;
  // 定义动画
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // 初始化控制器
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              _controller.forward();
            } else if (status == AnimationStatus.completed) {
              _controller.reverse();
            }
          });
    // Tweem动画不用parent
    _animation = Tween(begin: 0.0, end: 2.0 * pi).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    // 动画控制器的dispose要先于super调用
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated builder page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget child) {
                return Transform.rotate(
                  angle: _animation.value,
                  child: child,
                );
              },
              child: FlutterLogo(size: 40),
            ),
          ),
          Center(
            child: Text('Transform.rotate()'),
          )
        ],
      ),
    );
  }
}
