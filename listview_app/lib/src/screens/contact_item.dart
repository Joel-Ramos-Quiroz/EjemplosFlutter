import 'package:flutter/material.dart';
import 'package:listview_app/src/model/contac_model.dart';

class ContactItem extends StatelessWidget {
  final ContacModel contact;
  ContactItem({this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.name[0]),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.email),
    );
  }
}
