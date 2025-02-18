import 'package:flutter/material.dart';
import 'signup.dart';
import 'accountdetail.dart';
import 'country.dart';
import 'favorite.dart';
import 'EditPassword.dart';
import 'notification.dart';
import 'saved.dart';
import 'help.dart';
import 'daftar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Menu',
      home: Scaffold(
        body: _pages[_selectedIndex],
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
      ),
    );
  }
}

void navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => navigateTo(context, detail()), // Make sure this widget exists
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User 1',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'user@gmail.com',
                        style: TextStyle(color: Colors.white60, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Akun', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Favorit'),
            onTap: () => navigateTo(context, Favorite()),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Notifikasi'),
            onTap: () => navigateTo(context, NotifikasiScreen()),
          ),
          Divider(),
          Text('Pengaturan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            leading: Icon(Icons.language),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Negara'),
            onTap: () => navigateTo(context, NegaraPage()),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Ganti password'),
            onTap: () => navigateTo(context, editPw()), // Fix this widget
          ),
          Divider(),
          Text('Support', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            leading: Icon(Icons.contact_support),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Hubungi kami'),
            onTap: () => navigateTo(context, Help()),
          ),
          Divider(),
          Text('Dapatkan Uang Lebih dari Sleep Stay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            leading: Icon(Icons.upload_file),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Unggah properti Anda'),
            onTap: () => navigateTo(context, ClientIdPage()), // Ensure this widget exists
          ),
          Divider(),
          Text('Informasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ListTile(
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Tentang Sleep Stay'),
            onTap: () => navigateTo(context, Help()),
          ),
          Divider(),
          // Keluar Section
          ListTile(
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Keluar'),
            onTap: () => navigateTo(context, Signup()),
          ),
        ],
      ),
    );
  }
}