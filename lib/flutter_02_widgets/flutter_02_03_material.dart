import 'package:flutter/material.dart';

// 參考 https://doc.flutterchina.club/widgets-intro/

void main() {
  runApp(const MaterialApp(
    title: 'Flutter Tutorial',
    home:  TutorialHome(),
  ));
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}


class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局元件.
    return  Scaffold(
      appBar:  AppBar(
        leading:  const IconButton(
          icon:  Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title:  const Text('Example title'),
        actions: const <Widget>[
           IconButton(
            icon:  Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占瑩幕的大部分
      body:  const Center(
        child:  Text('Hello, world!'),
      ),
      floatingActionButton:  const FloatingActionButton(
        tooltip: 'Add',
        onPressed: null, // used by assistive technologies
        child:  Icon(Icons.add),
      ),
    );
  }
}
