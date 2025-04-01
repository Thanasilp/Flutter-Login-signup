import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
  static Future<List> fetchBooks() async {
    final url = Uri.parse('https://www.anapioficeandfire.com/api/books');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }
}
