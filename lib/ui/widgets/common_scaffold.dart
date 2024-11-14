import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/widgets/common_drawer.dart';
import 'package:flutter_ui/ui/widgets/custom_float.dart';
import 'package:flutter_ui/utils/uidata.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final backGroundColor;
  final actionFirstIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;

  const CommonScaffold(
      {super.key, this.appTitle,
      required this.bodyData,
      this.showFAB = false,
      this.showDrawer = false,
      this.backGroundColor,
      this.actionFirstIcon = Icons.search,
      this.scaffoldKey,
      this.showBottomNav = false,
      this.centerDocked = false,
      this.floatingIcon,
      this.elevation = 4.0});

  Widget myBottomBar() => BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Ink(
          height: 50.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: UIData.kitGradients)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                child: InkWell(
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      "ADD TO WISHLIST",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              SizedBox(
                height: double.infinity,
                child: InkWell(
                  onTap: () {},
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  child: const Center(
                    child: Text(
                      "ORDER PAGE",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: elevation,
        backgroundColor: Colors.black,
        title: Text(appTitle),
        actions: <Widget>[
          const SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(actionFirstIcon),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      drawer: showDrawer ? CommonDrawer() : null,
      body: bodyData,
      floatingActionButton: showFAB
    ? CustomFloat(
        builder: centerDocked
            ? const Text(
                "5",
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              )
            : const SizedBox.shrink(),  // En lugar de `null`
        icon: floatingIcon,
        qrCallback: () {
          // Acción al hacer clic en el FAB
        },
      )
    : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}
