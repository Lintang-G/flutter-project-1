import 'package:flutter/material.dart';
import 'booking.dart';
import 'package:intl/intl.dart';

class HotelDesc extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final String rating;
  final int price;
  final String location; // Add location parameter

  HotelDesc({
    super.key,
    required this.name,
    required this.image,
    required this.address,
    required this.rating,
    required this.price,
    required this.location, // Initialize it
  });

  final formatCurrency = NumberFormat("#,###", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, location); // Pass the location back
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
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
                        "Hotel - $rating",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(address),
                  Divider(),
                  _buildRoomOptions(context),
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

  Widget _buildRoomOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis kamar yang direkomendasikan", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildRoomCard(context, "Standard Room", "assets/kamar1.jpg", "1", price),
        _buildRoomCard(context, "Deluxe Room", "assets/kamar2.jpg", "2", price + 200000),
      ],
    );
  }

  Widget _buildRoomCard(BuildContext context, String roomName, String imagePath, String bedType, int price) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roomName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.bed, size: 16, color: Colors.black54),
                        SizedBox(width: 4),
                        Text(bedType, style: TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rp ${formatCurrency.format(price)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Example date, replace with your date picker or logic.
                    String checkInDate = "Jumat, 1 Januari 2025";
                    String checkOutDate = "Sabtu, 01 Februari 2025";

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPage(
                          hotelName: name,
                          hotelAddress: address,
                          roomPrice: formatCurrency.format(price),
                          checkInDate: checkInDate,
                          checkOutDate: checkOutDate,
                        ),
                      ),
                    );
                  },
                  child: Text("Pesan Sekarang"),
                ),
              ],
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
