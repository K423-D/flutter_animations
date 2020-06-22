/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 17:19:16
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 17:35:38
 * @FilePath     : \flutter_animations\lib\animated_container.dart
 */
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated container page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              child: Center(
                child: Text(
                  '可以作用在宽高，边界，形状，颜色等属性上',
                  style: TextStyle(
                    color: _isChanged ? Colors.white : Colors.black,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: _isChanged ? 200 : 100,
              width: _isChanged ? 200 : 300,
              decoration: BoxDecoration(
                  color: _isChanged ? Colors.redAccent : Colors.lightBlueAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: _isChanged
                      ? BorderRadius.circular(20)
                      : BorderRadius.circular(50)),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _isChanged = !_isChanged;
                  });
                },
                child: Text('切换样式'),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
