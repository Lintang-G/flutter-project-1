import 'package:flutter/material.dart';
import 'paymentSuccess.dart';

class PaymentLoadingPage extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String amount;

  const PaymentLoadingPage({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.amount,
  });

  @override
  State<PaymentLoadingPage> createState() => _PaymentLoadingPageState();
}

class _PaymentLoadingPageState extends State<PaymentLoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentSuccessPage(
            email: widget.email,
            firstName: widget.firstName,
            lastName: widget.lastName,
            phone: widget.phone,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Memproses pembayaranmu", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text("Jumlah", style: TextStyle(color: Colors.black54)),
                Text(
                  "Rp ${widget.amount}", // Menampilkan jumlah pembayaran yang dikirim dari BookingPage
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
