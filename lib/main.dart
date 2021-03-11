import 'package:bloc101/presentation/screens/home_screen.dart';
import 'package:bloc101/presentation/screens/second_screen.dart';
import 'package:bloc101/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubits/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        routes: {
          '/': (contex) => BlocProvider.value(
                value: _counterCubit,
                child: MyHomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ),
              ),
          '/second': (contex) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                  title: 'Second Screen',
                  color: Colors.redAccent,
                ),
              ),
          '/third': (contex) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.greenAccent,
                ),
              ),
        });
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
