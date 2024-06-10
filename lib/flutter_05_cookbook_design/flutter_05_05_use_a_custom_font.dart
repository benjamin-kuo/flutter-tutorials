import 'package:flutter/material.dart';

//使用自訂字體
//https://docs.flutter.dev/cookbook/design/fonts
//https://docs.flutter.cn/cookbook/design/fonts/

// 如何選擇字體。
// 如何導入字體檔。
// 如何設置預設字體。
// 如何在特定 widget 中使用字體。

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      // Set LXGWWenKaiMonoTC as the default app font.
      theme: ThemeData(fontFamily: 'NotoSans'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar uses the app-default NotoSans font.
      appBar: AppBar(title: const Text('使用自訂字體')),
      body: const Center(
        // This Text widget uses the NotoSans font.
        child: Text(
          'NotoSans 字型範例',
          style: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
    );
  }
}