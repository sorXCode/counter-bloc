import 'package:counter_with_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter(Bloc)',
        home: BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
          child: CounterPage(),
        ));
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    Widget button(IconData icon, CounterEvent action)=> RaisedButton(
      child: Icon(icon),
      onPressed: () => counterBloc.add(action),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              button(Icons.fast_forward, CounterEvent.x2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button(Icons.remove, CounterEvent.decrement),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 24),
                  ),
                  button(Icons.add, CounterEvent.increment)
                ],
              ),
              button(Icons.refresh, CounterEvent.reset)
            ],
          ),
        );
      }),
    );
  }
}
