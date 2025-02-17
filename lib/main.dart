import 'package:flutter/material.dart';
import 'Offers.dart';
import 'saved.dart';
import 'accountmanagement.dart';
import 'help.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Search Page')),
    SavedPage(),
    Help(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> _carouselItems = [
    {'title': 'Bali', 'image': 'assets/bali.jpeg'},
    {'title': 'Medan', 'image': 'assets/medan.jpeg'},
    {'title': 'Jakarta', 'image': 'assets/jakarta.jpg'},
    {'title': 'Surabaya', 'image': 'assets/surabaya.jpeg'},
  ];

  final TextEditingController _destinationController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _suggestions = [];
  List<String> _allDestinations = ['Bali', 'Medan', 'Jakarta', 'Surabaya'];

  bool _showDropdown = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showDropdown = _focusNode.hasFocus && _suggestions.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sleep Stay',
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/image1.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pesan hotel, apartemen dan vila dengan mudah.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextField(
                            controller: _destinationController,
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              labelText: 'Destinasi',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.location_on),
                            ),
                            onChanged: (text) {
                              setState(() {
                                _suggestions = _allDestinations
                                    .where((destination) =>
                                    destination.toLowerCase().contains(text.toLowerCase()))
                                    .toList();
                                _showDropdown = _focusNode.hasFocus && _suggestions.isNotEmpty;
                              });
                            },
                          ),
                          if (_showDropdown)
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                children: _suggestions.map((String suggestion) {
                                  return ListTile(
                                    title: Text(suggestion),
                                    onTap: () {
                                      _destinationController.text = suggestion;
                                      setState(() {
                                        _suggestions.clear();
                                        _showDropdown = false;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Tanggal masuk',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Tanggal keluar',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    SizedBox(
                    width: 339, // Adjust the width as needed
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Offers(destination: _destinationController.text),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Cari',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _carouselItems.length,
                  itemBuilder: (context, index) {
                    final item = _carouselItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              item['image']!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )
          : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.pink[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Save'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Help'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
