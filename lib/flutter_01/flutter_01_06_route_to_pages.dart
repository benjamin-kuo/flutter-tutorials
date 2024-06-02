import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 參考 https://doc.flutterchina.club/get-started/codelab/ 的分析
// 使用外部包(package), 加入 english_words 依賴, 再執行 flutter packages get, 把 pubspec.yaml 用到的套件把載回來
// 建立 無限滾動的 List
// 加入互動
// 將新增顯示我的最愛內容的新頁面（在Flutter中稱為路由（route））
// 在Flutter中，導航器管理應用程式的路由棧。 將路由推入（push）到導航器的棧中，將會顯示更新為該路由頁面。
// 從導航器的棧中彈出（pop）路由，將顯示返回到前一個路由。
// 同時 使用主题更改UI, 您可以通過配置ThemeData類輕鬆更改應用程式的 Theme。

void main() => runApp(const HelloFlutter());

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
      ),
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
  final _saved = <WordPair>{};

  final _biggerFont = const TextStyle(fontSize: 16.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random(); // 删除这两行
    //return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
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
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  // builder返回一個Scaffold，其中包含名為“Saved Suggestions”的新路由的應用欄。
  // 新路由的body由包含ListTiles行的ListView組成; 每行之間通過一個分隔線分隔。
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,

                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
