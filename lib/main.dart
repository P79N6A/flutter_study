import 'package:flutter/material.dart';
import 'package:flutter_study/views/news_page/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

//  TabController controller;

  static List tabData = [
    {'text': '动态', 'icon': Icon(Icons.language)},
    {'text': 'Flutter基础', 'icon': Icon(Icons.alarm)},
    {'text': 'Dart基础', 'icon': Icon(Icons.alarm_on)}
  ];

  @override
  void initState() {
    super.initState();
//    controller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
//    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabData[/*controller.index*/0]['text'])),
      body: NewsPage()
//      body: TabBarView(
//          controller:controller,
//          children: <Widget>[
//             NewsPage(),
//          ]),

    );
  }
}
