import 'package:flutter/material.dart';
import '../widgets/coffee_list.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coffee Lists")),
      body: const CoffeeList(),
    );
  }
}
