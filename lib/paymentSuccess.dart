import 'package:flutter/material.dart';
import 'receipt.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;

  const PaymentSuccessPage({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              "Pembayaran Berhasil!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Terima kasih telah melakukan pembayaran.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiptPage(
                      email: email,
                      firstName: firstName,
                      lastName: lastName,
                      phone: phone,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: const Text("Lihat Resi", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}