/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-23 14:39:01
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 14:47:22
 * @FilePath     : \flutter_animations\lib\custom_page_trasition.dart
 */
import 'package:flutter/material.dart';

PageTransitionsBuilder createTransition() {
  return CustomTransitionsBuilder();
}

// 自定义页面切换动画
class CustomTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
