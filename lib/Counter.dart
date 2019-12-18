import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Stream<int> stream;
  final Sink<int> sink;

  const Counter(this.stream, this.sink, {Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState(stream, sink);
}

class _CounterState extends State<Counter> {

  int _counter = 0;
  final Stream<int> _stream;
  final Sink<int> sink;

  _CounterState(this._stream, this.sink) {
    if (_stream != null) {
      _stream.listen((value) {
        _counter = _counter + value;
        if (sink != null) {
          sink.add(_counter);
        }
        setState(() {});
      });
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
}
