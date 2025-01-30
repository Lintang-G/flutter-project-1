import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NegaraPage(),
    );
  }
}

class NegaraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Negara",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                // Bendera Indonesia
                Container(
                  width: 24,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 8,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                      Container(
                        height: 8,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                // Nama Negara
                Expanded(
                  child: Text(
                    "Indonesia",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Ikon centang
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
