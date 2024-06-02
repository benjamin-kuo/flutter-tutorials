import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 參考 https://doc.flutterchina.club/get-started/codelab/ 的分析
// 使用外部包(package), 加入 english_words 依賴, 再執行 flutter packages get, 把 pubspec.yaml 用到的套件把載回來
// 建立 無限滾動的 List

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
        body: const RandomWords(),
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
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random(); // 删除这两行
    //return Text(wordPair.asPascalCase);
    return Scaffold (
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(12.0),
        // 對於每個建議的單詞對都會調用一次itemBuilder，然後將單詞對添加到ListTile行中
        // 在偶數行，該函數會為單詞對添加一個ListTile row.
        // 在奇數行，該函數會添加一個分割線widget，來分隔相鄰的詞對。
        // 注意，在小螢幕上，分割線看起來可能比較吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return const Divider();

          // 語法 「i~/ 2」 表示i除以2，但返回值是整形（向下取整），比如i為：1， 2， 3， 4， 5
          // 時，結果為0， 1， 1， 2， 2， 這可以計算出ListView中減去分隔線后的實際單詞對數量
          final index = i ~/ 2;
          // 如果是建議清單中最後一個單詞對
          if (index >= _suggestions.length) {
            // .. 接著再生成10個單詞對，然後添加到建議清單
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }


}