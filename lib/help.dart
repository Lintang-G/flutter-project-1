import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // Image Icon
            Image.asset(
              'assets/help.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // Help Message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                'Hai user, Anda tidak memiliki pemesanan.\nSetelah Anda melakukan pemesanan, Anda akan melihat jawaban pertanyaan yang mungkin Anda miliki di bagian ini.\n\nKlik "Mulai Menjelajahi" untuk memulai perjalanan StayHotel Anda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Explore Button
            ElevatedButton(
              onPressed: () {
                // Navigation logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Mulai Menjelahi',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
