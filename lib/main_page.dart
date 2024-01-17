import 'package:flutter/material.dart';
import 'package:user_crud_flutter/main_state.dart';
import 'package:user_crud_flutter/main_state_full.dart';

class MyHomePageState extends State<MyHomePage> {
  MainState mainState = MainState();

  void _incrementCounter() {
    setState(mainState.counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${mainState.message}',
            ),
            Text(
              '${mainState.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
