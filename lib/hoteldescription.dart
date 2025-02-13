import 'package:flutter/material.dart';
import 'booking.dart';
import 'Offers.dart';

class HotelDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Offers(destination: AutofillHints.addressCity)),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/intercontinental.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.hotel, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "Hotel - 3.5/5 (1990 ulasan)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Nama Hotel",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text("Medan Amplas, Medan"),
                  Text("Jl.setiabudi 1356"),
                  Divider(),
                  _buildRoomOptions(context), // ✅ Pass context
                  SizedBox(height: 16),
                  _buildPolicySection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomOptions(BuildContext context) { // ✅ Add context parameter
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis kamar yang direkomendasikan", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildRoomCard(context, "Standard Room", 189000), // ✅ Pass context
        _buildRoomCard(context, "Deluxe Room", 289000),   // ✅ Pass context
      ],
    );
  }

  Widget _buildRoomCard(BuildContext context, String roomName, int price) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(roomName, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Rp $price"),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, // ✅ Use the context parameter
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
              child: Text("Pesan Sekarang"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kebijakan Properti", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        SizedBox(height: 8),
        Text("- Check-in mulai dari pukul 10:00 hingga 05:00"),
        Text("- Check-out sebelum pukul 12:00"),
      ],
    );
  }
}
