import 'package:flutter/material.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pasien'),
      ),
      body: const Center(
        child: Text('Tambah Pasien'),
      ),
    );
  }
}
