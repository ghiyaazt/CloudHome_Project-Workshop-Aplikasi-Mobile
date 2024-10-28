import 'package:flutter/material.dart';
// Pastikan Anda juga membuat file ini untuk layar cuaca
import 'home.dart';

class LayarLogin extends StatelessWidget {
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
            // Gambar logo CuacaApp dengan ukuran lebih besar
            Image.asset(
              'assets/images/logo3 2.png', // Ganti dengan nama file gambar Anda
              width: 150, // Ukuran diperbesar
              height: 150, // Ukuran diperbesar
            ),
            SizedBox(height: 10), // Jarak antara logo dan judul

            // Judul CuacaApp
            Text(
              "CuacaApp",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            // Kontainer form login
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Kolom Username
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nama Pengguna",
                      border: OutlineInputBorder(),
                      prefixIcon: ImageIcon(
                        AssetImage('assets/images/profile.png'), // Gambar untprofile.pnguk Username
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Kolom Password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      border: OutlineInputBorder(),
                      prefixIcon: ImageIcon(
                        AssetImage('assets/images/padlock.png'), // Gambar untuk Password
                        color: Colors.black
                      ),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Masuk
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman cuaca setelah login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CloudHomeApp()),
                      );
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
                      // Aksi ketika tombol kembali ditekan
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
