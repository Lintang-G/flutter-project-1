import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 213, 223),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Profil dengan tanda kembali
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Warna putih untuk latar belakang
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      // Aksi untuk kembali
                    },
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage('assets/images.jpeg'), // Foto bulat
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8), // Tambah spasi antara nama dan bawahnya
                        Row(
                          children: [
                            const Text(
                              '15% Profil selesai       ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 8),
                            Stack(
                              children: [
                                Container(
                                  height: 5,
                                  width: 150, // Lebar total garis abu-abu
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 26, // Lebar warna merah sesuai persentase
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form Input
            Expanded(
              child: ListView(
                children: [
                  buildTextField('Nama', 'User'),
                  buildTextField('Tanggal Lahir', '--'),
                  buildTextField('Jenis Kelamin', 'Pilih Jenis Kelamin'),
                  buildTextField('Status Pernikahan', 'Pilih Status Pernikahan'),
                  buildTextField('Alamat', 'Ketik Alamat Anda'),
                  buildTextField('Kota', 'Kota Sekarang'),
                  buildTextField('Telepon', '+08** **** ****'),
                ],
              ),
            ),

            // Tombol Simpan
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Naikkan sedikit
              child: ElevatedButton(
                onPressed: () {
                  // Aksi Simpan
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Simpan Perubahan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255), // Warna hitam untuk teks
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Field Input
  Widget buildTextField(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

