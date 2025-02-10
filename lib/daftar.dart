import 'package:flutter/material.dart';
import 'accountmanagement.dart';

class SleepStayApp extends StatelessWidget {
  const SleepStayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClientIdPage(),
    );
  }
}

class ClientIdPage extends StatelessWidget {
  const ClientIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // Logo dan nama aplikasi
            Column(
              children: [
                Image.asset('assets/logo.png',width: 150,height: 150,),
                const SizedBox(height: 8),
                const Text(
                  'SLEEP STAY',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Input ID Klien
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan id Klien Anda',
                filled: true,
                fillColor: const Color(0xFFD1C4E9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Simpan
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5C6BC0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Center(
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
