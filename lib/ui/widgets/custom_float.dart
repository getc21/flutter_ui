import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/uidata.dart';

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;

  const CustomFloat({super.key, required this.icon, required this.builder, required this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            builder != null
                ? Positioned(
                    right: 7.0,
                    top: 7.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10.0,
                      child: builder,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}
