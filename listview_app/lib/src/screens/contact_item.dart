import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("R"),
      ),
      title: Text("Rodrigo"),
      subtitle: Text("Contactos"),
    );
  }
}
