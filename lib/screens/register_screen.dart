import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'login_screen.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a new user with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Navigate to home or login screen after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Beranda()),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account registered successfully')),
        );
      } on FirebaseAuthException catch (e) {
        // Handle registration errors
        String message;
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else {
          message = 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Background clouds
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(100)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Icon(Icons.cloud, color: Colors.white, size: 100),
                    ),
                    Positioned(
                      top: 70,
                      right: 40,
                      child: Icon(Icons.cloud, color: Colors.white, size: 120),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Logo and title
              Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    'CloudHome',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Register form container
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureTextPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureTextConfirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Re-Password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureTextConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _toggleConfirmPasswordVisibility,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.blue[
                              700], // Ganti 'primary' dengan 'backgroundColor'
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Back to login link
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman login
                },
                child: Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
