import 'package:database/screens/page/inventory.dart';
import 'package:database/screens/page/stock.dart';
import 'package:database/screens/speedDial.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class Home extends StatefulWidget {
  final List<BottomNavigationBarItem>? items;

  const Home({super.key, this.items});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> tabs = [const Inventory(), Stock()];

  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
        title: const Text('Pasien', style: TextStyle(fontSize: 20)),
        icon: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: const FittedBox(child: Icon(Icons.medical_services))),
        backgroundColor: Colors.cyan),
    TitledNavigationBarItem(
        title: const Text('Data', style: TextStyle(fontSize: 20)),
        icon: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: const FittedBox(child: Icon(Icons.medical_information))),
        backgroundColor: Colors.cyan),
    TitledNavigationBarItem(
        title: const Text('Barang', style: TextStyle(fontSize: 20)),
        icon: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: const FittedBox(child: Icon(Icons.inventory))),
        backgroundColor: Colors.cyan),
    TitledNavigationBarItem(
        title: const Text('Habis', style: TextStyle(fontSize: 20)),
        icon: SizedBox.fromSize(
            size: const Size.fromRadius(20),
            child: const FittedBox(child: Icon(Icons.inventory_2_outlined))),
        backgroundColor: Colors.cyan),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: TitledBottomNavigationBar(
          curve: Curves.easeInBack,
          items: items,
          activeColor: Colors.white,
          inactiveColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          height: 60,
          indicatorHeight: 2,
        ),
        body: IndexedStack(index: _currentIndex, children: tabs),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const speedDial());
  }
}
