import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/tools/arc_clipper.dart';
import 'package:flutter_ui/utils/uidata.dart';

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;
  LoginBackground({super.key, this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 2,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: UIData.kitGradients,
              )),
            ),
            showIcon
                ? Center(
                    child: SizedBox(
                        height: deviceSize.height / 8,
                        width: deviceSize.width / 2,
                        child: const FlutterLogo(
                          textColor: Color.fromARGB(255, 255, 230, 5),
                        )),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = Flexible(
    flex: 3,
    child: Container(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
