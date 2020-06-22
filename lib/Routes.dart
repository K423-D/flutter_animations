/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 11:37:50
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 18:16:37
 * @FilePath     : \flutter_animations\lib\Routes.dart
 */
import 'package:flutter/material.dart';
import 'package:flutteranimations/align_transition.dart';
import 'package:flutteranimations/animated_align.dart';
import 'package:flutteranimations/animated_builder_page.dart';
import 'package:flutteranimations/animated_container.dart';
import 'package:flutteranimations/animated_cross_fade.dart';
import 'package:flutteranimations/animated_icon.dart';
import 'package:flutteranimations/animated_opacity.dart';
import 'package:flutteranimations/animated_padding.dart';
import 'package:flutteranimations/animated_switcher.dart';
import 'package:flutteranimations/home_page.dart';

class Routes {
  static final home = '/';
  static final animatedBuilderPage = '/animatedBuilder';
  static final alignTransitionPage = '/alignTransition';
  static final animatedOpacityPage = '/animatedOpacity';
  static final animatedAlignPage = '/animatedAlign';
  static final animatedPaddingPage = '/animatedPadding';
  static final animatedCrossFadePage = '/animatedCrossFade';
  static final animatedContainerPage = '/animatedContainer';
  static final animatedSwitcherPage = '/animatedSwitcher';
  static final animatedIconPage = '/animatedIcon';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => MyHomePage(title: 'animation 基本用法'),
    animatedBuilderPage: (context) => AnimatedBuilderPage(),
    alignTransitionPage: (context) => AlignTransitionPage(),
    animatedOpacityPage: (context) => AnimatedOpacityPage(),
    animatedAlignPage: (context) => AnimatedAlignPage(),
    animatedPaddingPage: (context) => AnimatedPaddingPage(),
    animatedCrossFadePage: (context) => AnimatedCrossFadePage(),
    animatedContainerPage: (context) => AnimatedContainerPage(),
    animatedSwitcherPage: (context) => AnimatedSwitcherPage(),
    animatedIconPage: (context) => AnimatedIconPage(),
  };
}
