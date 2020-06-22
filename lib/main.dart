/*
 * @description  : 这里修改文件描述
 * @Author       : k423
 * @Date         : 2020-06-22 09:48:36
 * @LastEditors  : k423
 * @LastEditTime : 2020-06-22 11:47:03
 * @FilePath     : \flutter_animations\lib\main.dart
 */
import 'package:flutter/material.dart';
import 'package:flutteranimations/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}
