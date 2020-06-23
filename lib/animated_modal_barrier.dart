/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-23 10:13:13
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 10:26:04
 * @FilePath     : \flutter_animations\lib\animated_modal_barrier.dart
 */
import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  @override
  _AnimatedModalBarrierPageState createState() =>
      _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animation = ColorTween(begin: Colors.redAccent, end: Colors.blueAccent)
        .animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated modal barrier page'),
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          child: AnimatedModalBarrier(
            color: _animation,
            // 默认可以点击
            dismissible: true,
          ),
        ),
      ),
    );
  }
}
