import 'package:flutter/material.dart';
import 'package:flutter_login/screen/books_page.dart';
import 'package:flutter_login/screen/coffee_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BooksPage()),
                );
              },
              child: const Text('Books'),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoffeePage()),
                );
              },
              child: const Text('Coffee'),
            ),
          ),
        ],
      ),
    );
  }
}
