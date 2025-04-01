import 'package:flutter/material.dart';
import 'package:flutter_login/screen/homepage.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_login/theme/theme.dart';
import 'package:flutter_login/widgets/custom_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'test@test.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '123456',
  );
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  /// ✅ ฟังก์ชัน Sign In ด้วย FirebaseAuth
  Future<void> _signInWithEmailPassword() async {
    if (_formSignInKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );

        print("User logged in: ${userCredential.user?.email}");

        // ✅ ตรวจสอบว่า widget ยังอยู่ใน tree ก่อนใช้ context
        if (!mounted) return;

        // แสดงข้อความเข้าสู่ระบบสำเร็จ
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Sign in Successful')));

        // ไปยังหน้า Home (ต้องเปลี่ยนเป็นหน้าของคุณ)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ), // 🔥 เปลี่ยนเป็นหน้า Home ของคุณ
        );
      } catch (e) {
        // ✅ ตรวจสอบว่า widget ยังอยู่ใน tree ก่อนใช้ context
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign in Failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: Colors.black,
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>((
                                  states,
                                ) {
                                  if (states.contains(WidgetState.pressed)) {
                                    return Colors.grey.shade800;
                                  }
                                  return Colors.black;
                                }),
                          ),
                          onPressed: _signInWithEmailPassword,
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withValues(alpha: (0.5 * 255)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign in with',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withValues(alpha: 0.5 * 255),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      // Incase having an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Bootstrap.facebook),
                          Icon(Bootstrap.google),
                          Icon(Bootstrap.apple),
                          Icon(Bootstrap.twitter_x),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      // Incase not having an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SigninScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
