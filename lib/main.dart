import 'package:bloc101/logic/cubits/internet_cubit.dart';
import 'package:bloc101/presentation/screens/home_screen.dart';
import 'package:bloc101/presentation/screens/second_screen.dart';
import 'package:bloc101/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubits/counter_cubit.dart';
import 'presentation/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
  final Connectivity? connectivity;

  const MyApp({Key? key, this.appRouter, this.connectivity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit(connectivity)),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          routes: {
            '/': (contex) => MyHomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ),
            '/second': (contex) => SecondScreen(
                  title: 'Second Screen',
                  color: Colors.redAccent,
                ),
            '/third': (contex) => ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.greenAccent,
                ),
          }),
    );
  }
}
