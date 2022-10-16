import 'package:database/screens/page/Database/addDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: camel_case_types
class speedDial extends StatelessWidget {
  const speedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.remove,
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
              child: const Icon(Icons.add),
              backgroundColor: Colors.lightBlueAccent,
              onTap: () => _addDialog(context),
              label: 'Tambah Produk',
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.0),
              labelBackgroundColor: Colors.cyan),
          SpeedDialChild(
              child: const Icon(Icons.search),
              backgroundColor: Colors.lightBlueAccent,
              onTap: () {}, //showSearch(context: context, delegate: Search())
              label: 'Cari Produk',
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.0),
              labelBackgroundColor: Colors.cyan),
        ]);
  }
}

void _addDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Add();
    },
  );
}
