import 'package:flutter/material.dart';
import 'package:listview_app/src/model/contac_model.dart';
import 'package:listview_app/src/screens/contact_item.dart';

class Contact extends StatelessWidget {
  buildList() {
    return <ContacModel>[
      ContacModel(name: "Rodrigo Morales", email: "rodrigo@gmail.com"),
      ContacModel(name: "Martin Fowler", email: "martin@gmail.com"),
      ContacModel(name: "Linux tolvar", email: "linux@gmail.com"),
      ContacModel(name: "Steve Wozniak", email: "steve@gmail.com"),
      ContacModel(name: "Robert Martin", email: "robert@gmail.com"),
      ContacModel(name: "Dennis Ritchie", email: "dennis@gmail.com"),
    ];
  }

  List<ContactItem> buildContactList() {
    return buildList()
        .map<ContactItem>((contact) => ContactItem(
              contact: contact,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      body: ListView(
        children: buildContactList(),
      ),
    );
  }
}
