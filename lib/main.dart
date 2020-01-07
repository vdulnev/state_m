import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<MyHomePageBloc>(
        create: (context) => MyHomePageBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePageEvent {}

class MyHomePageState {}

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {

  @override
  MyHomePageState get initialState => MyHomePageState();

  @override
  Stream<MyHomePageState> mapEventToState(MyHomePageEvent event) async* {
    yield MyHomePageState();
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {

    final MyHomePageBloc myHomePageBloc = BlocProvider.of<MyHomePageBloc>(context);

    return BlocBuilder<MyHomePageBloc, MyHomePageState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title + ' ${counterBloc.state}'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child:  Counter(bloc: counterBloc),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _incButtonClicked(myHomePageBloc),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _incButtonClicked(MyHomePageBloc myHomePageBloc) {
    counterBloc.add(CounterEvent.increment);
    myHomePageBloc.add(MyHomePageEvent());
  }
}
