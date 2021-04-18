import 'package:bloc101/logic/cubits/counter_cubit.dart';
import 'package:bloc101/logic/cubits/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/routes/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
  final Connectivity? connectivity;

  const MyApp({Key? key, this.appRouter, this.connectivity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (_) => InternetCubit(connectivity)),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        onGenerateRoute: appRouter?.onGenerateRoute,
      ),
    );
  }
}
