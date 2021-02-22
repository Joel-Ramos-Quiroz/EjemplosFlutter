import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 600,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Los Andes #865',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('Perú - Lambayeque - Chiclayo'),
            leading: Icon(
              Icons.directions,
              color: Colors.blue[500],
            ),
          ),
          //Divider(),
          ListTile(
            title: Text('(962744596',
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text('irvinjoelramosquiroz@gmail.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),);
  }
}
