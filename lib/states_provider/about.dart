/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';

import 'drawer_menu.dart';
import 'model/ui.dart';


class About extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: const DrawerMenu(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return RichText(
              text: TextSpan(
                text: text,
                style:
                    TextStyle(fontSize: ui.dealWithFontSizeByUser, color: Colors.lightBlue),
              ),
            );
          },
        ),
      ),
    );
  }
}
