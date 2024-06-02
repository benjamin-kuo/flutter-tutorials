import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 參考 https://doc.flutterchina.club/get-started/codelab/ 的分析
// 使用外部包(package), 加入 english_words 依賴, 再執行 flutter packages get, 把 pubspec.yaml 用到的套件把載回來
// 隨機 取名

void main() => runApp(const HelloFlutter());

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          //child: Text('Hello World'),
          child: Text(wordPair.asPascalCase)    // 此時的 body 就不能使用 const
        ),
      ),
    );
  }
}

