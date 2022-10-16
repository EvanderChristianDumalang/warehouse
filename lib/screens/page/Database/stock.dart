import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/provider/auth.dart';
import 'package:database/util.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Stock extends StatelessWidget {
  Stock({super.key});

  CollectionReference drugDatabase =
      FirebaseFirestore.instance.collection('drugDatabase');
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Habis'),
          backgroundColor: Colors.cyan,
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text('Keluar', style: TextStyle(color: Colors.red)),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: Center(
            child: StreamBuilder(
                stream: drugDatabase.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return const CircularProgressIndicator();
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var drugDatabase = snapshot.data!.docs[index];
                        if (drugDatabase['jumlah'] < 3) {
                          return Center(
                              child: Card(
                            color: Colors.redAccent,
                            child: ListTile(
                              title: Text(
                                  capitalizeFirstCharacter(
                                      drugDatabase['nama']),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                capitalizeFirstCharacter(
                                    drugDatabase['jumlah'].toString()),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: TextButton(
                                  onLongPress: () {
                                    drugDatabase.reference.delete();
                                  },
                                  onPressed: () {
                                    drugDatabase.reference.delete();
                                  },
                                  child:
                                      const Icon(Icons.delete, color: Colors.black)),
                            ),
                          ));
                        }
                        return const Center(child: Text(''));
                      });
                })));
  }
}
