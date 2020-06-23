/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 11:37:50
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 14:25:44
 * @FilePath     : \flutter_animations\lib\Routes.dart
 */
import 'package:flutter/material.dart';
import 'package:flutteranimations/align_transition.dart';
import 'package:flutteranimations/animated_align.dart';
import 'package:flutteranimations/animated_builder_page.dart';
import 'package:flutteranimations/animated_container.dart';
import 'package:flutteranimations/animated_cross_fade.dart';
import 'package:flutteranimations/animated_icon.dart';
import 'package:flutteranimations/animated_list.dart';
import 'package:flutteranimations/animated_modal_barrier.dart';
import 'package:flutteranimations/animated_opacity.dart';
import 'package:flutteranimations/animated_padding.dart';
import 'package:flutteranimations/animated_switcher.dart';
import 'package:flutteranimations/hero/hero_first_page.dart';
import 'package:flutteranimations/hero/hero_second_page.dart';
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
  static final animatedModalBarrierPage = '/animatedModalBarrier';
  static final animatedListPage = '/animatedList';
  static final heroFirstPage = '/heroFirst';
  static final heroSecondPage = '/heroSecond';

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
    animatedModalBarrierPage: (context) => AnimatedModalBarrierPage(),
    animatedListPage: (context) => AnimatedListPage(),
    heroFirstPage: (context) => HeroFirstPage(),
    heroSecondPage: (context) => HeroSecondPage(),
  };
}
