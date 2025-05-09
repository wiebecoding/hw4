import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
      {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
      {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
      {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Books'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sorted by Author',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(book['title']!),
                      subtitle: Text(book['author']!),
                      onTap: () {
                        context.go('/byAuthor/detail', extra: book);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
