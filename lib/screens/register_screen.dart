import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayarRegister extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> register(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kata sandi tidak cocok")),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.pop(
            context); // Kembali ke layar login setelah registrasi berhasil
      }
    } on FirebaseAuthException catch (e) {
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
                    'assets/images/logo3 2.png', // Ganti dengan nama file gambar logo Anda
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

                  // Kolom Ulangi Password
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Ulangi Kata Sandi",
                      border: OutlineInputBorder(),
                      prefixIcon: ImageIcon(
                        AssetImage('assets/images/padlock.png'),
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Register
                  ElevatedButton(
                    onPressed: () {
                      register(context); // Panggil fungsi register
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
                        "Daftar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Kembali
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    child: Text(
                      "Kembali",
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
