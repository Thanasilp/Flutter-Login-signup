import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCoffee {
  static Future<List> fetchCoffee() async {
    final url = Uri.parse('http://10.0.2.2:4000/product');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['products']; //ดึงเฉพาะ list ของ products
    } else {
      throw Exception('Failed to load coffee');
    }
  }
}
