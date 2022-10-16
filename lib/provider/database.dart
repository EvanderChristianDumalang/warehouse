import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/model/drug.dart';

class DatabaseService {
  final CollectionReference drugDataCollection = FirebaseFirestore.instance.collection('drugdatabase');
  final String uid;
  DatabaseService({required this.uid});

  Future drugDatabase(String nama, int jumlah) async{
    return await drugDataCollection.doc(uid).set({
      'nama' : nama,
      'jumlah' : jumlah
    });
  }

  Future<void> updateDatabase(String nama, int jumlah, String id) async{
    return await drugDataCollection.doc(id).set({
      'jumlah' : jumlah
    });
  }

  List<Drug> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Drug(
        nama: doc['nama'] ?? '',
        jumlah: doc['jumlah'] ?? 0,
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Drug>> get drugBase {
    return drugDataCollection.snapshots()
      .map(_brewListFromSnapshot);
  }
}