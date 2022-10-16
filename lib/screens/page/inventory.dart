import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/screens/page/update.dart';
import 'package:database/util.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class Product {
  final String nama;
  final int jumlah;

  Product(this.nama, this.jumlah);
}

class _InventoryState extends State<Inventory> {
  CollectionReference drugDatabase =
      FirebaseFirestore.instance.collection('drugDatabase');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Barang'),
          backgroundColor: Colors.cyan,
          elevation: 0.0,
          actions: const <Widget>[],
        ),
        body: Center(
            child: StreamBuilder(
                stream: drugDatabase.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var drugDatabase = snapshot.data!.docs[index];
                        return Center(
                            child: Card(
                          color: Colors.greenAccent,
                          child: ListTile(
                            title: Text(
                                capitalizeFirstCharacter(drugDatabase['nama']),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                capitalizeFirstCharacter(
                                    drugDatabase['jumlah'].toString()),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            trailing: TextButton(
                                onLongPress: () {
                                  drugDatabase.reference.delete();
                                },
                                onPressed: () {
                                  drugDatabase.reference.delete();
                                },
                                child: const Icon(Icons.delete,
                                    color: Colors.red)),
                            onTap: () {
                              _updateDialog(context);
                            },
                          ),
                        ));
                      });
                })));
  }
}

void _updateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Update();
    },
  );
}
