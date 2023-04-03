import 'package:advanced_widgets/widgets/weather_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool themeSwitcher = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeSwitcher ? ThemeData.light() : ThemeData.dark(),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onThemeToggle: () => setState(() {
          themeSwitcher = !themeSwitcher;
        }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.onThemeToggle});

  final String title;
  VoidCallback onThemeToggle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isExpand = false;
  double cloudness = 0.5;

  void _incrementCounter() {
    setState(() {
      widget.onThemeToggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            right: 16.0,
            top: 16.0,
            width: isExpand?(query.size.width - 16*2):150,

            duration: const Duration(seconds: 1),
            child: WeatherIndicator(
              cloudness: cloudness,
              isExpanded: isExpand,
              onTap: () => setState(() {
                isExpand = !isExpand;
              }),
            ),
          ),
          Positioned(
            left: 16.0,
            right: 64.0,
            bottom: 16.0,
            child: Slider(
              value: cloudness,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (value) => setState(() {
                cloudness = value;
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
