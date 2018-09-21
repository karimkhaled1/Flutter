import 'package:flutter/material.dart';

class more extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_right),
        ), ListTile(
          title: Text("about us"),
          leading: Icon(Icons.file_download),
          trailing: Icon(Icons.arrow_right),
        ), ListTile(
          title: Text("policy"),
          leading: Icon(Icons.security),
          trailing: Icon(Icons.arrow_right),
        )
      ],
    );
  }
}
