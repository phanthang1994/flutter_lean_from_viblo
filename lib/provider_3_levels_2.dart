// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// https://sotatek.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/15785418#overview
// 13:10
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Level2());
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = "test1 ChangeNotifier";

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
