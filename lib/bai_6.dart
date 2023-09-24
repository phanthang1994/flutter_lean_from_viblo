import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build myapp");
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var listTile = <Widget>[Tile(), Tile()]; // tạo 1 list lưu trữ 2 Widget

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build MyHomePage");
    }
    return Scaffold(
      body: Center(
        child: Row(
          children: listTile, // Row nhận một list Widget nên mình truyền listTile vào
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget, // thực hiện hoán đổi vị trí 2 Widget trong listTile
        child: Icon(Icons.swap_horiz),
      ),
    );
  }

  // hàm thực hiện hoán đổi 2 Widget trong listTile
  void swapTwoTileWidget() {
    setState(() {
      listTile.insert(1, listTile.removeAt(0)); // (*)
    });
  }
}


class Tile extends StatefulWidget {
  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  final Color color = generateRandomColor();
 // mỗi object sẽ có 1 random Color không thể thay đổi
  @override
  Widget build(BuildContext context) {
    // tạm hiểu Container như cái thùng có màu sắc, kích thước => khá giống viên gạch =))
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

// hàm tạo ra một Color bất kỳ
Color generateRandomColor() {
  // biến random sẽ giúp ta tạo ra 1 số ngẫu nhiên
  final Random random = Random();

  // Màu sắc được tạo nên từ RGB, là một số ngẫu nhiên từ 0 -> 255 và opacity = 1
  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}
