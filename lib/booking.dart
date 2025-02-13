import 'package:flutter/material.dart';
import 'payment.dart';
import 'bank.dart';
import 'day.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool isAgreed = false;
  String selectedBank = "Pilih Metode Pembayaran";
  String selectedDays = "Pilih jumlah hari";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final String roomPrice = "000.000,00"; // Harga tetap

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sleep Stay Hotel Permatasari",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Jln. Jamin Ginting, Gg Semangka II, Medan, Indonesia, 12345"),
            const SizedBox(height: 10),
            const Text(
              "Jumat, 1 Januari 2025 - Sabtu, 01 Februari 2025",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Input Data Pengguna
            const Text("Alamat Email", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Pengguna@gmail.com",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Depan",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Belakang",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text("Telepon", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),

            // Pemilihan Metode Pembayaran
            const Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BankSelectionPage()),
                );
                if (result != null) {
                  setState(() {
                    selectedBank = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedBank),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Pemilihan Hari Menginap
            const Text("Jumlah Malam", style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DaySelectionPage()),
                );
                if (result != null) {
                  setState(() {
                    selectedDays = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedDays),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: isAgreed,
                  onChanged: (value) {
                    setState(() {
                      isAgreed = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text("Saya setuju dengan ketentuan pemesanan"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jumlah yang Harus Dibayarkan"),
                  Text(
                    "Rp $roomPrice",
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Pembayaran
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isAgreed
                    ? () {
                  if (selectedBank == "Pilih Metode Pembayaran") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Pilih metode pembayaran terlebih dahulu"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (selectedDays == "Pilih jumlah hari") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Pilih jumlah malam menginap"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentLoadingPage(
                        email: emailController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phone: phoneController.text,
                        amount: roomPrice,
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAgreed ? Colors.red : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Bayar Sekarang",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}