import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorDetailPage extends StatelessWidget {
  const AuthorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail of the Book',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ]
        )
      )
    );
  }
}