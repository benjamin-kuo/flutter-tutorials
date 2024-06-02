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

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          //child: Text('Hello World'),
          child: RandomWords(),
        ),
      ),
    );
  }
}

// 把 random word 改成 一個 stateful widget
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});
  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
