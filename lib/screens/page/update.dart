import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  CollectionReference drugDatabase =
      FirebaseFirestore.instance.collection('drugDatabase');
  String error = "";
  int jumlah = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
              Container(
                  width: 300,
                  height: 350,
                  margin: const EdgeInsets.only(
                      top: 15.0, left: 15.0, right: 15.0, bottom: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('Edit Produk',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: "Jumlah Produk",
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          try {
                            if (val!.isEmpty) {
                              return "Jumlah Produk Kosong";
                            } else if (val.isNotEmpty) {
                              bool mobileValid =
                                  RegExp(r'^(?:[0]9)?[0-9]{2}$').hasMatch(val);
                              return mobileValid ? null : "Harus Angka";
                            }
                          } catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                          }
                          return null;
                        },
                        onChanged: (val) {
                          try {
                            setState(() => jumlah = int.parse(val));
                          } catch (e) {
                            setState(() => error = 'Harus Angka');
                          }
                        },
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      const SizedBox(height: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Batal',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () {
                                  try {
                                    if (jumlah.toString().isEmpty) {
                                      setState(() => error = 'Ada Yang Kosong');
                                    } else {
                                      drugDatabase.get().then((value) =>
                                          value.docs.forEach((element) {
                                            drugDatabase.doc().get().then(
                                                (value) => drugDatabase
                                                    .doc(element.id)
                                                    .set({'jumlah': jumlah}));
                                          }));

                                      Navigator.of(context).pop();
                                    }
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                  }
                                },
                                child: const Text('Ubah',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ))
            ])));
  }
}
