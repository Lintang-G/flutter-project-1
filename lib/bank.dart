import 'package:flutter/material.dart';

class BankSelectionPage extends StatelessWidget {
  const BankSelectionPage({super.key});

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
        title: const Text("Metode Pembayaran", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("SeaBank"),
            onTap: () => Navigator.pop(context, "SeaBank"),
          ),
          ListTile(
            title: const Text("Bank Mandiri"),
            onTap: () => Navigator.pop(context, "Bank Mandiri"),
          ),
          ListTile(
            title: const Text("Bank BNI"),
            onTap: () => Navigator.pop(context, "Bank BNI"),
          ),
          ListTile(
            title: const Text("Bank BCA"),
            onTap: () => Navigator.pop(context, "Bank BCA"),
          ),
          ListTile(
            title: const Text("Bank BRI"),
            onTap: () => Navigator.pop(context, "Bank BRI"),
          ),
        ],
      ),
    );
  }
}