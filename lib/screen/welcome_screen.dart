import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(child: Container(
            child: Text("Welcome"),
            )),
            Flexible(child: Text("Welcome"),
            ],
            ),
      ),
    );
  }
}
