import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

//用占位符淡入图片

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: widget(child: const CircularProgressIndicator()),
            imageUrl:
            'https://raw.githubusercontent.com/benjamin-kuo/images/main/books/%E5%B0%91%E4%BA%86%E4%BD%A0%E7%9A%84%E9%A4%90%E6%A1%8C-%E5%B7%9D%E6%9C%AC%E4%B8%89%E9%83%8E%20.png',
          ),
        ),
      ),
    );
  }

  widget({required CircularProgressIndicator child}) {}
}
