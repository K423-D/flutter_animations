/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 18:03:25
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 17:52:36
 * @FilePath     : \flutter_animations\lib\animated_icon.dart
 */
import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  @override
  _AnimatedIconPageState createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<AnimatedIconData> _list = [
    AnimatedIcons.add_event,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.close_menu,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.event_add,
    AnimatedIcons.home_menu,
    AnimatedIcons.list_view,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,
    AnimatedIcons.menu_home,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.view_list,
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _controller.forward();
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
        title: Text('animated icon page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: _list.map((el) {
              return Container(
                width: 80,
                height: 80,
                child: Center(
                  child: AnimatedIcon(
                    icon: el,
                    progress: _controller,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
