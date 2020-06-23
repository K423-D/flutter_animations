/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-23 10:29:20
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 11:52:15
 * @FilePath     : \flutter_animations\lib\animated_list.dart
 */
import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage>
    with SingleTickerProviderStateMixin {
  List<String> _list = [];
  AnimationController _controller;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  _addItem() {
    final int _index = _list.length;
    _list.insert(_index, _index.toString());
    // 插入元素的方法（会启用动画）
    _listKey.currentState.insertItem(_index);
  }

  _removeItem() {
    if (_list.length != 0) {
      final int _index = _list.length - 1;
      String item = _list[_index];
      // 删除元素的方法（启用动画）
      _listKey.currentState.removeItem(_index,
          (context, animation) => _buildListItem(item, _index, animation));
      _list.removeAt(_index);
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated list page'),
      ),
      body: AnimatedList(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return _buildListItem(_list[index], index, animation);
        },
        key: _listKey,
        initialItemCount: _list.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _addItem();
            },
            child: Text('add item'),
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          RaisedButton(
            onPressed: () {
              _removeItem();
            },
            child: Text('remove item'),
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }

  // 构建item，可以修改动画效果
  Widget _buildListItem(String title, int index, Animation animation) {
    // 滑动动画
    // return SlideTransition(
    //   position: animation
    //       .drive(CurveTween(curve: Curves.easeIn))
    //       .drive(Tween(begin: Offset(1, 1), end: Offset(0, 0))),
    //   child: ListTile(
    //     title: Text(title),
    //     subtitle: Text('第 $index 个元素'),
    //   ),
    // );

    // 掉落动画
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        leading: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.black,
            progress: _controller),
        title: Text('No.${index + 1}'),
        subtitle: Text('第 ${index + 1} 个元素'),
        trailing: AnimatedIcon(
            icon: AnimatedIcons.search_ellipsis,
            color: Colors.black,
            progress: _controller),
        onTap: () {
          _controller.forward();
        },
        onLongPress: () {
          _controller.reverse();
        },
      ),
    );
  }
}
