import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/auth_bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30.0),
              child: FilledButton(
                child: Text("Login"),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(
                    context,
                  ).add(AuthenticationLoginEvent());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
