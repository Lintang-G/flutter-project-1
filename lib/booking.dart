import 'package:flutter/material.dart';
import 'payment.dart';
import 'bank.dart';
import 'day.dart';

class BookingPage extends StatefulWidget {
  final String hotelName;
  final String hotelAddress;
  final String roomPrice; // Make roomPrice a parameter
  final String checkInDate; // Add checkInDate
  final String checkOutDate; // Add checkOutDate

  const BookingPage({
    super.key,
    required this.hotelName,
    required this.hotelAddress,
    required this.roomPrice,
    required this.checkInDate, // Add checkInDate to constructor
    required this.checkOutDate, // Add checkOutDate to constructor
  });

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
            Text(
              widget.hotelName, // Use the passed hotel name
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(widget.hotelAddress), // Use the passed hotel address
            const SizedBox(height: 10),
            Text(
              "${widget.checkInDate} - ${widget.checkOutDate}", // Display check-in and check-out dates
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

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

            // Input Telepon
            const Text("Telepon", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
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
                    "Rp ${widget.roomPrice}", // Use the passed room price
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
                  backgroundColor: isAgreed ? Colors.blueAccent : Colors.grey,
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
