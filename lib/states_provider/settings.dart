/// Created by Mahmud Ahsan
/// https://github.com/mahmudahsan
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer_menu.dart';
import 'model/ui.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Settings'),
      ),
      drawer: const DrawerMenu(),
      body: Consumer<UI>(builder: (context, ui, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Font Size: ${ui.dealWithFontSizeByUser.toInt()}',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize),
              ),
            ),
            Slider(
                min: 0.5,
                value: ui.sliderFontSizeFromUser,
                onChanged: (newValue) {
                  ui.dealWithFontSizeByUser = newValue;
                }),
          ],
        );
      }),
    );
  }
}
