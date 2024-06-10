import 'package:flutter/material.dart';
// Include the Google Fonts package to provide more text format options
// https://pub.dev/packages/google_fonts , 在 pubspec.yaml 引入 google fonts
import 'package:google_fonts/google_fonts.dart';

// 使用 Themes 統一顏色和字體風格
// https://docs.flutter.dev/cookbook/design/themes
// https://docs.flutter.cn/cookbook/design/themes/

// 針對特定 widget 的樣式。
// 重載的繼承主題的樣式。
// 應用的統一樣式。


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = '客製化主題';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        // colorScheme 定義颜色。
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          // TRY THIS: Change to "Brightness.light" and see that all colors change to better contrast a light background.
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default text styling for headlines, titles, bodies of text, and more.
        // textTheme 定義了文字樣式。
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // TRY THIS: Change one of the GoogleFonts to "lato", "poppins", or "lora".
          // The title uses "titleLarge" and the middle text uses "bodyMedium".
          titleLarge: GoogleFonts.afacad(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            'Text with a background color',
            // TRY THIS: Change the Text value or change the Theme.of(context).textTheme to "displayLarge" or "displaySmall".
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          // TRY THIS: Change the seedColor to "Colors.red" or "Colors.blue".
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
