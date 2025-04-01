import 'package:flutter/material.dart';
import '../widgets/books_list.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Lists")),
      body: const BooksList(),
    );
  }
}
