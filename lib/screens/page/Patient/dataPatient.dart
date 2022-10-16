import 'package:flutter/material.dart';

class DataPatient extends StatelessWidget {
  const DataPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
      ),
      body: const Center(
        child: Text('Data Pasien'),
      ),
    );
  }
}