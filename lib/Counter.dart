import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  final CounterController controller;

  Counter(this.controller);

  @override
  _CounterState createState() => _CounterState(controller);
}

class _CounterState extends State<Counter> {

  final CounterController controller;
  int _counter = 0;

  _CounterState(this.controller){
    if (controller != null) {
      controller.counterState = this;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }

  void inc() {
    setState(() {
      _counter++;});
  }
}

class CounterController {
  _CounterState counterState;

  void inc() {
    if (counterState != null) {
      counterState.inc();
    }
  }
}
