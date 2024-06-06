import 'package:flutter/material.dart';

// 參考 https://doc.flutterchina.club/widgets-intro/
// Text
// Row（水平方向）、Column（垂直方向）
// Stack：取代線性佈局，是基於Web開發中的絕度定位（absolute positioning ）佈局模型設計的。
// Container：可建立矩形視覺元素

void main() {
  runApp(const MaterialApp(
    title: 'Widget Basic', // used by the OS task switcher
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    //  是UI呈現的“一張紙”
    return const Material(
      // Column is 垂直方向的線性佈局.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              //style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}


class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});

  // Widget子類中的字段往往都會定義為“final”
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // 單位是邏輯上的像素（並非真實的像素，類似於瀏覽器中的圖元）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null  會禁用 button
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}



