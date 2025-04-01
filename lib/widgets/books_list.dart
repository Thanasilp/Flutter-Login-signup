import 'package:flutter/material.dart';
import '../services/api_books.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  List books = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    try {
      final data = await BookService.fetchBooks();
      setState(() {
        books = data;
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return books.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              title: Text(book['name']),
              subtitle: Text("Author: ${book['authors'][0]}"),
            );
          },
        );
  }
}
