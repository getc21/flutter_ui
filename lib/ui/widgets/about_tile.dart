import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/uidata.dart';

class MyAboutTile extends StatelessWidget {
  const MyAboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutListTile(
      applicationIcon: FlutterLogo(
        textColor: Colors.yellow,
      ),
      icon: FlutterLogo(
        textColor: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By Pawan Kumar",
        ),
        Text(
          "MTechViral",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
