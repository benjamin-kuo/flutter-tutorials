import 'package:flutter/material.dart';

//滑動清除效果
//https://docs.flutter.dev/cookbook/gestures/dismissible
//https://docs.flutter.cn/cookbook/gestures/dismissible/
//
//1. Create a list of items
//
//Create a data source
//Convert the data source into a list
//
//2. Wrap each item in a Dismissible widget
//3. Provide "leave behind" indicators

void main() {
  runApp(const MyApp());
}

// MyApp is a StatefulWidget. This allows updating the state of the widget when an item is removed.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}
