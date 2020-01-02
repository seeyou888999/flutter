/*
 *  Developer by dove on 19-12-31 下午6:24
 *  Last modified 19-12-31 下午6:20.
 *  Copyright (c) 2019. All rights reserved.
 */

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dropmenu_wx/drop_wx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(color: Colors.transparent);
    };
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.black,
      ),
      home: Scaffold(
        body: HomePager(),
      ),
    );
  }
}

class HomePager extends StatefulWidget {
  @override
  _HomePagerState createState() => _HomePagerState();
}

class _HomePagerState extends State<HomePager> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DropWXMenu(
        header: buildHeader(),
        content: buildContent(),
      ),
    );
  }

  buildHeader() {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Container(
          child: Text(
            '小程序',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Flexible(
          child: new ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  '最近使用',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 8),
                buildColumn(),
                SizedBox(height: 32),
                Text(
                  '我的小程序',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  // 添加
                  physics: NeverScrollableScrollPhysics(),
                  // 添加
                  itemCount: 24,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 横轴元素个数
                    mainAxisSpacing: 10.0, // 纵轴间距
                    crossAxisSpacing: 10.0, // 横轴间距
                    childAspectRatio: 1.0, // 子组件宽高长度比例
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: () {},
                      child: buildColumn(),
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  buildColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              'res/user.png',
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '最近使用',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  buildContent() {
    return new ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder:
              (BuildContext buildContext, int index) {
            return ListTile(
              title: Text(
                '123',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text('123',
                  style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.ac_unit),
            );
          }),
    );
  }
}
