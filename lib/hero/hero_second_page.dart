/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-23 13:33:32
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 15:22:46
 * @FilePath     : \flutter_animations\lib\hero\hero_second_page.dart
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroSecondPage extends StatefulWidget {
  @override
  _HeroSecondPageState createState() => _HeroSecondPageState();
}

class _HeroSecondPageState extends State<HeroSecondPage> {
  int _index;

  @override
  void didChangeDependencies() {
    if (_index == null) {
      setState(() {
        _index = ModalRoute.of(context).settings.arguments;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero second page'),
      ),
      body: _index == null
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Column(
              children: <Widget>[
                Hero(
                  tag: 'Hero$_index',
                  child: Container(
                    child: Image.asset('assets/books-$_index.jpg'),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Center(
                    child: Text('传过来的参数：$_index'),
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, '这是第 $_index 张图片');
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
