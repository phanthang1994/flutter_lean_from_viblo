// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//https://sotatek.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/15785418#overview
//13:10
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String data = "test1";
  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (BuildContext context) => data,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data),
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
    return  Column(
      children: [
        Container(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}

