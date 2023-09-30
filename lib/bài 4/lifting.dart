import 'package:flutter/material.dart';
//https://stackoverflow.com/questions/74058512/simple-explanation-of-lifting-state-up
class BlueSquare extends StatelessWidget {
  final int numClicks;
  final Function() callback;

  const BlueSquare({
    Key? key,
    required this.numClicks,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        color: Colors.blue,
        height: 30,
        width: 30,
        child: Center(
          child: Text(
            "$numClicks",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BlueSquareParent extends StatefulWidget {
  const BlueSquareParent({super.key});

  @override
  _BlueSquareParentState createState() => _BlueSquareParentState();
}

class _BlueSquareParentState extends State<BlueSquareParent> {
  int numClicksTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          BlueSquare(
            numClicks: numClicksTotal,
            // callback: addClick,
            callback: (){},
          ),
          BlueSquare(
            numClicks: numClicksTotal,
            callback: addClick,
          ),
        ],
      ),
    );
  }

  void addClick() {
    setState(() {
      numClicksTotal++;
    });
  }
}

void main() {
  runApp(const SafeArea(
    child:  MaterialApp(
      home: Center(child: BlueSquareParent()),
    ),
  ));
}
