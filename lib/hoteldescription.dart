import 'package:flutter/material.dart';
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
              MaterialPageRoute(builder: (context) => Offers(destination: '',)),
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
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            // Hotel Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.hotel, color: Colors.green),
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
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 8),
                      Text("3.5/5 (Baik) - Rating 2 bulan terakhir: 3.3")
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildReviewChip("Iwin Santoso", 3.5),
                      SizedBox(width: 8),
                      _buildReviewChip("Azis Munandar", 4.0),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildDateSelector(),
                  SizedBox(height: 16),
                  _buildFacilitiesSection(),
                  SizedBox(height: 16),
                  _buildRoomOptions(),
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

  Widget _buildReviewChip(String reviewer, double rating) {
    return Chip(
      label: Text("$reviewer - $rating"),
      backgroundColor: Colors.blue[100],
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateCard("Check-in", "St. 1 FEB 2025"),
        _buildDateCard("Check-out", "St. 5 FEB 2025"),
      ],
    );
  }

  Widget _buildDateCard(String title, String date) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(title, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 8),
              Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Fasilitas", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildFacilityChip("Alat Mandi Gratis"),
            _buildFacilityChip("Sofa"),
            _buildFacilityChip("Washroom Shower"),
            _buildFacilityChip("Resepsionis"),
          ],
        )
      ],
    );
  }

  Widget _buildFacilityChip(String facility) {
    return Chip(
      label: Text(
        facility,
        style: TextStyle(color: Colors.white), // Set the font color
      ),
      backgroundColor: Colors.blueAccent,
      side: BorderSide.none,
    );
  }

  Widget _buildRoomOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis kamar yang direkomendasikan", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildRoomCard("Standard Room", 189000),
        _buildRoomCard("Deluxe Room", 289000),
      ],
    );
  }

  Widget _buildRoomCard(String roomName, int price) {
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
                Text("Rp $price")
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Pesan Sekarang"),
            )
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