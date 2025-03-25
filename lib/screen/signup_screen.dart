import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/custom_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: const Text('Sign up'),
    );
  }
}