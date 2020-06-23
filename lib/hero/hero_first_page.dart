/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-23 13:22:16
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-23 15:21:18
 * @FilePath     : \flutter_animations\lib\hero\hero_first_page.dart
 */
import 'package:flutter/material.dart';
import 'package:flutteranimations/Routes.dart';

class HeroFirstPage extends StatefulWidget {
  @override
  _HeroFirstPageState createState() => _HeroFirstPageState();
}

class _HeroFirstPageState extends State<HeroFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero first page'),
      ),
      body: Center(
        child: Wrap(
          // 水平方向间隔（mainAxis）
          spacing: 10,
          // 竖直方向间隔（crossAxis）
          runSpacing: 10,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          children: _buildImages(),
        ),
      ),
    );
  }

  List<Widget> _buildImages() {
    List<Widget> _list = [];
    for (var i = 0; i < 4; i++) {
      _list.add(ImageItem(index: i));
    }
    return _list;
  }
}

// 当build嵌套build时，获取不到外层context，使得snackBar报错
class ImageItem extends StatelessWidget {
  final int index;
  ImageItem({this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var result = await Navigator.pushNamed(context, Routes.heroSecondPage,
            arguments: index + 1);
        // 设置snack bar
        SnackBar snackBar = new SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text(
                '返回的信息：${result ?? '空'}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          duration: Duration(seconds: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(label: '我知道了', onPressed: () {}),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Hero(
        tag: 'Hero${index + 1}',
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/books-${index + 1}.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
