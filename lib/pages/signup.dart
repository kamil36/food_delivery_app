// lib/screens/login_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/constant/const.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cpassController = TextEditingController();
  bool _obscurePass = true;
  bool _obscureConfirmPass = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  registorform() async {
    final password = _passController.text.trim();
    final confirmPassword = _cpassController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passController.text.trim());
        context.go(MyRoutes.loginpage);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Account Sign Up Successfully!"),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
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
                    "Please Sign Up here",
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
                  CustomStyle.mediumHeight,
                  Container(
                    width: CustomStyle.Mqh(context) / 1.6,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _passController,
                      obscureText: _obscurePass,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscurePass = !_obscurePass;
                            });
                          },
                        ),
                        label: Text("Password"),
                        labelStyle: TextStyle(color: Color(0xff3B82F6)),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter 6 Digit Password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        } else if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        } else if (!value.contains(RegExp(r'[a-z]'))) {
                          return 'Password must contain at least one lowercase letter';
                        } else if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Password must contain at least one number';
                        } else if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomStyle.mediumHeight,
                  Container(
                    width: CustomStyle.Mqh(context) / 1.6,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _cpassController,
                      obscureText: _obscureConfirmPass,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPass = !_obscureConfirmPass;
                            });
                          },
                        ),
                        label: Text("Confirm Password"),
                        labelStyle: TextStyle(color: Color(0xff3B82F6)),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Confirm your password';
                        } else if (value != _passController.text.trim()) {
                          return 'Passwords do not match';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        } else if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        } else if (!value.contains(RegExp(r'[a-z]'))) {
                          return 'Password must contain at least one lowercase letter';
                        } else if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Password must contain at least one number';
                        } else if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomStyle.hugeHeight,
                  Center(
                    child: InkWell(
                      onTap: registorform, // Call the registration function
                      child: Container(
                        width: CustomStyle.Mqw(context) / 1.5,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff3B82F6),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: CustomStyle.normalbold.merge(const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomStyle.hugeHeight,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: CustomStyle.normalbold.merge(const TextStyle(
                            // color: Colors.black,
                            fontSize: 16,
                          )),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(MyRoutes.loginpage);
                          },
                          child: Text(
                            "Login",
                            style: CustomStyle.normalbold.merge(const TextStyle(
                              color: Color(0xff3B82F6),
                              fontSize: 20,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
