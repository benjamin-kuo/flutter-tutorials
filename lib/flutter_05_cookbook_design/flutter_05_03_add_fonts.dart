import 'package:flutter/material.dart';

// 以 package 的方式使用字體, assets 資料夾放在根目錄
// https://docs.flutter.dev/cookbook/design/package-fonts
// https://docs.flutter.cn/cookbook/design/package-fonts/
// 1. Add a font to a package
// 2. Add the package and fonts to the app
//   Add the package to the app
//   Declare the font assets
// 3. Use the font (https://pub.dev/packages/google_fonts 下載字型)

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Package Fonts',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar uses the app-default font.
      appBar: AppBar(title: const Text('Package Fonts')),
      body: const Center(
        // This Text widget uses the Raleway font.
        child: Text(
          'Using the LXGWWenKaiMonoTC font from the awesome_package, 中文字型看看',
          style: TextStyle(
            fontFamily: 'LXGWWenKaiMonoTC',
          ),
        ),
      ),
    );
  }
}