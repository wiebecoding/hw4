import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/auth_bloc/auth_bloc.dart';
import 'package:hw4/navigation/routerHW.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // Placed an Authentication Bloc above the MaterialApp.router
  final authenticationBloc = AuthenticationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationBloc..add(AuthenticationLoginEvent()),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: routerHW(authenticationBloc),
      ),
    );
  }
}
