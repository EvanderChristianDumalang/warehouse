import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  String empty = "";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, empty);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(empty);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List myList = [];
    if (query.isEmpty) {
      myList =
          FirebaseFirestore.instance.collection('drugDatabase').snapshots() as List;
    } else {
      myList = FirebaseFirestore.instance
          .collection('drugDatabase')
          .snapshots()
          .where((element) =>
              element.toString().startsWith(query[0].toUpperCase()))
          .toList() as List;
    }

    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = myList[index];
            showResults(context);
          },
          leading: const Icon(Icons.insert_chart),
          title: Text(
            myList[index],
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        );
      },
    );
  }
}
