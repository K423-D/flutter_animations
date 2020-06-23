/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 09:57:01
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 13:55:28
 * @FilePath     : \flutter_animations\lib\home_page.dart
 */
import 'package:flutter/material.dart';
import 'package:flutteranimations/Routes.dart';

class Bean {
  String name;
  String routeName;
  Bean({this.name, this.routeName});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _isActived = false;
  // 动画控制器
  AnimationController _controller;
  // 动画
  Animation _animation;
  Animation _animation1;
  List<Bean> _list = [
    Bean(name: 'AnimatedBuilder', routeName: Routes.animatedBuilderPage),
    Bean(name: 'AlignTransition', routeName: Routes.alignTransitionPage),
    Bean(name: 'AnimatedOpacity', routeName: Routes.animatedOpacityPage),
    Bean(name: 'AnimatedAlign', routeName: Routes.animatedAlignPage),
    Bean(name: 'AnimatedPadding', routeName: Routes.animatedPaddingPage),
    Bean(name: 'AnimatedCrossFade', routeName: Routes.animatedCrossFadePage),
    Bean(name: 'AnimatedContainer', routeName: Routes.animatedContainerPage),
    Bean(name: 'AnimatedSwitcher', routeName: Routes.animatedSwitcherPage),
    Bean(name: 'AnimatedIcon', routeName: Routes.animatedIconPage),
    Bean(
        name: 'AnimatedModalBarrier',
        routeName: Routes.animatedModalBarrierPage),
    Bean(name: 'AnimatedList', routeName: Routes.animatedListPage),
    Bean(name: 'HeroFirstPage', routeName: Routes.heroFirstPage),
  ];

  void _doSomething() {
    if (_isActived) {
      // 反转动画
      _controller.reverse();
    } else {
      // 开始动画
      _controller.forward();
    }
    setState(() {
      _isActived = !_isActived;
    });
  }

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    //  添加监听器，实现界面更新
    _controller.addListener(() {
      setState(() {});
    });
    // 设置动画曲线
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation1 = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    // 设置开始与结束的值
    _animation = Tween(begin: 100.0, end: 150.0).animate(_animation);
    _animation1 =
        ColorTween(begin: Colors.lightBlueAccent, end: Colors.redAccent)
            .animate(_animation1);
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
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Container(
              color: _animation1.value,
              width: _animation.value,
              height: _animation.value,
              child: Center(child: Text('动画组件')),
            ),
          ),
          Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: _buildActionChips(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            _isActived ? Colors.grey : Theme.of(context).primaryColor,
        onPressed: () {
          _doSomething();
        },
        tooltip: 'action',
        child: Icon(Icons.power_settings_new),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> _buildActionChips() {
    return _list.map((el) {
      return ActionChip(
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            'K',
            style: TextStyle(color: Colors.black),
          ),
        ),
        label: Text(
          el.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, el.routeName);
        },
      );
    }).toList();
  }
}
