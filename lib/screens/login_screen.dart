import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'register_screen.dart';

class LayarLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        // Navigasi ke halaman cuaca setelah login sukses
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CloudHomeApp()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[300]!, Colors.blue[900]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo3 2.png', // Ganti dengan nama file gambar Anda
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),

                  // Kolom Email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: ImageIcon(
                        AssetImage('assets/images/profile.png'),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Kolom Password
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(),
                      prefixIcon: ImageIcon(
                        AssetImage('assets/images/padlock.png'),
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Masuk
                  ElevatedButton(
                    onPressed: () {
                      signIn(context); // Panggil fungsi signIn
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Kembali
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Kembali",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                  // Tombol Register
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LayarRegister(),
                        ),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
