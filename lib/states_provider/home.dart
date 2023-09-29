/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';

import 'drawer_menu.dart';
import 'model/ui.dart';


const kAppTitle = 'State Management by Provider';
const kStateType = 'Provider';

class Home extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: const DrawerMenu(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(fontSize: ui.fontSize, color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}
