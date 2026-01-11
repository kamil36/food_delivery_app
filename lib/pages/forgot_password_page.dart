// lib/screens/login_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';
import 'package:go_router/go_router.dart';
import 'package:food_delivery_app/routes/router_config.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset link sent to your email")),
      );

      if (!mounted) return;
      context.go(MyRoutes.loginpage);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Something went wrong")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, color: Colors.blue, size: 80),
                        CustomStyle.mediumHeight,
                        Text("Forgot Password",
                            style: CustomStyle.highbold.merge(TextStyle())),
                      ],
                    ),
                  ),
                  CustomStyle.hugeHeight,
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.bag_fill,
                        color: Colors.blue.shade500,
                      ),
                      CustomStyle.smallWidth,
                      const Text(
                        "STOREx",
                        style: CustomStyle.highbold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Welcome",
                        style: CustomStyle.highbold,
                      ),
                      CustomStyle.smallWidth,
                      Text(
                        "👋",
                        style: CustomStyle.highbold.merge(const TextStyle(
                          color: Colors.amber,
                        )),
                      ),
                    ],
                  ),
                  Text(
                    "Forgot Password",
                    style: CustomStyle.normal.merge(TextStyle(
                      color: Colors.grey.shade500,
                    )),
                  ),
                  CustomStyle.mediumHeight,
                  Container(
                    width: CustomStyle.Mqh(context) / 1.6,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        label: Text("Email Address"),
                        labelStyle: TextStyle(color: Color(0xff3B82F6)),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter a Valid Email Address';
                        } else if (!value.contains('@')) {
                          return 'Email Address must contain "@"';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomStyle.hugeHeight,
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _resetPassword();
                        }
                      },
                      child: Container(
                        width: CustomStyle.Mqw(context) / 1.5,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff3B82F6),
                        ),
                        child: Center(
                          child: Text(
                            "Reset Password",
                            style: CustomStyle.normalbold.merge(
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomStyle.mediumHeight,
                  Center(
                      child: TextButton(
                    onPressed: () {
                      context.go(MyRoutes.loginpage);
                    },
                    child: Text("Back to Login",
                        style: CustomStyle.medium.merge(TextStyle(
                          color: Color(0xff3B82F6),
                        ))),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
