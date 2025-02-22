import 'package:flutter/material.dart';
import 'main.dart';
import 'saved.dart';
import 'accountmanagement.dart';
import 'help.dart';
import 'hoteldescription.dart';
import 'package:intl/intl.dart';

class Offers extends StatefulWidget {
  final String destination;

  const Offers({super.key, required this.destination});

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  String selectedDestination = "";

  @override
  void initState() {
    super.initState();
    selectedDestination = widget.destination;
  }

  final List<Map<String, dynamic>> _hotels = [
    {
      "name": "Intercontinental Bali Resort",
      "location": "bali",
      "image": "assets/intercontinental.jpg",
      "address": "Uluwatu St No.45, Jimbaran, Kuta selatan",
      "rating": "4.8/5",
      "price": 4000000,
    },
    {
      "name": "Everyday hotel",
      "location": "bali",
      "image": "assets/pullman.jpg",
      "address": "Uluwatu St No.45, Jimbaran, Kuta selatan",
      "rating": "3.2/5",
      "price": 224000,

    },
    {
      "name": "Raffles Bali",
      "location": "bali",
      "image": "assets/76947569_XL.jpg",
      "address": "Uluwatu St No.45, Jimbaran, Kuta selatan",
      "rating": "4.9/5",
      "price": 7000000,

    },
    {
      "name": "Padma Resort Ubud",
      "location": "bali",
      "image": "assets/images.jpeg",
      "address": "Padma Resort Ubud Banjar Carik, Desa, Puhu,",
      "rating": "4.8/5",
      "price": 3500000,

    },
    {
      "name": "Hotel Indonesia",
      "location": "jakarta",
      "image": "assets/HIjakarta.jpg",
      "address": "Jl. M.H. Thamrin No.1, Menteng, Kota Jakarta Pusat",
      "rating": "4.7/5",
      "price": 3800000,
    },
    {
      "name": "Four Seasons jakarta",
      "location": "jakarta",
      "image": "assets/download.jpeg",
      "address": "Jl. Gatot Subroto No.18, Kuningan Bar. Kota Jakarta Pusat",
      "rating": "4.8/5",
      "price": 3380000,

    },
    {
      "name": "Grand Gyatt Jakarta",
      "location": "jakarta",
      "image": "assets/images1.jpeg",
      "address": " Jl. M.H. Thamrin No.Kav. 28-30, Gondangdia, Kota Jakarta Pusat",
      "rating": "4.7/5",
      "price": 3000000,

    },
    {
      "name": "Aryaduta",
      "location": "medan",
      "image": "assets/aryaduta.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Medan Bar.",
      "rating": "4.4/5",
      "price": 2560000,
    },
    {
      "name": "Swiss-Bellinn",
      "location": "medan",
      "image": "assets/swissmedan.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Medan Bar.",
      "rating": "4.4/5",
      "price": 2560000,
    },
    {
      "name": "JW mariott",
      "location": "medan",
      "image": "assets/images2.jpeg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Medan Bar.",
      "rating": "4.4/5",
      "price": 300000,
    },
    {
      "name": "Pullman",
      "location": "medan",
      "image": "assets/pullman.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Medan Bar.",
      "rating": "4.4/5",
      "price": 2000000,
    },
    {
      "name": "JW Marriott",
      "location": "surabaya",
      "image": "assets/HI.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Surabaya baru.",
      "rating": "4.0/5",
      "price": 640000
    },
    {
      "name": "Swiss-bellinn",
      "location": "surabaya",
      "image": "assets/swisspakarang.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Surabaya baru.",
      "rating": "4.0/5",
      "price": 500000,
    },
    {
      "name": "JW Marriott",
      "location": "surabaya",
      "image": "assets/HI.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Surabaya baru.",
      "rating": "4.0/5",
      "price": 500000,
    },
    {
      "name": "Ibis Styles",
      "location": "bandung",
      "image": "assets/ibisbandung.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Bandung baru.",
      "rating": "4.0/5",
      "price": 600000,
    },
    {
      "name": "Garrya bianti",
      "location": "yogyakarta",
      "image": "assets/bianti.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Yogyakarta baru.",
      "rating": "4.0/5",
      "price": 500000,

    },
    {
      "name": "Tree park hotel",
      "location": "banjarmasin",
      "image": "assets/treepark.jpg",
      "address": "Jl. Putri Hijau No.10, Kesawan, Kec. Surabaya baru.",
      "rating": "4.0/5",
      "price": 500000,
    },
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Main()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SavedPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Help()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredHotels = _hotels
        .where((hotel) => widget.destination.isEmpty || hotel["location"] == widget.destination)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Offers in ${widget.destination.isEmpty ? "All Locations" : widget.destination}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: filteredHotels.isEmpty
          ? const Center(child: Text("No hotels available for this destination."))
          : ListView.builder(
        itemCount: filteredHotels.length,
        itemBuilder: (context, index) {
          final hotel = filteredHotels[index];
          return _buildHotelCard(
            context,
            hotel["name"],
            hotel["image"],
            hotel["address"],
            hotel["rating"],
            hotel["price"],
            hotel["location"]
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

  Widget _buildHotelCard(
      BuildContext context,
      String hotelName,
      String imagePath,
      String address,
      String rating,
      int price,
      String location // Add location as a parameter
      ) {
    final formatCurrency = NumberFormat("#,###", "id_ID");

    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDesc(
              name: hotelName,
              image: imagePath,
              address: address,
              rating: rating,
              price: price,
              location: location, // Pass the location here
            ),
          ),
        );

        // If a location is returned, update Offers with the same destination
        if (result != null && result is String) {
          setState(() {
            selectedDestination = result;
          });
        }
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
                borderRadius: const BorderRadius.only(
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
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hotelName,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(address),
                    const SizedBox(height: 8),
                    Text(
                      "Rp${formatCurrency.format(price)},00/Malam",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
