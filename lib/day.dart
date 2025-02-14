import 'package:flutter/material.dart';

class DaySelectionPage extends StatelessWidget {
  const DaySelectionPage({super.key});

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
        title: const Text("Pemilihan Hari", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(  // Perbaikan Overflow
        child: Column(
          children: List.generate(31, (index) {
            return ListTile(
              title: Text("${index + 1} hari"),
              onTap: () => Navigator.pop(context, "${index + 1} hari"),
            );
          }),
        ),
      ),
    );
  }
}