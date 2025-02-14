import 'package:flutter/material.dart';
import 'main.dart';
import 'saved.dart';
import 'accountmanagement.dart';
import 'help.dart';
import 'hoteldescription.dart';

class Offers extends StatefulWidget {
  const Offers({super.key, required String destination});

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SavedPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Help()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Main()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          _buildHotelCard(context, "Intercontinental  Bali Resort", "assets/intercontinental.jpg", "Uluwatu St No.45, Jimbaran, Kuta selatan", "4.8/5", 4000000),
          _buildHotelCard(context, "Hotel Indonesia", "assets/HIjakarta.jpg", "Jl. M.H. Thamrin No.1, Menteng, Kota Jakarta Pusat", "4.7/5", 3800000),
          _buildHotelCard(context, "Pullman", "assets/pullman.jpg", "Jl. Putri Hijau No.10, Kesawan, Kec. Medan Bar.", "4.4/5", 2500000),
          _buildHotelCard(context, "JW Mariot", "assets/HI.jpg", "Jl. Putri Hijau No.10, Kesawan, Kec. Surabaya baru.", "4.0/5", 500000),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Colors.pink[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, String hotelName, String imagePath, String address, String rating, int price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HotelDesc()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hotelName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(address),
                    const SizedBox(height: 8),
                    Text("Rp$price,00/Malam", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
