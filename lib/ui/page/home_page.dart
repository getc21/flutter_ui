import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/logic/bloc/menu_bloc.dart';
import 'package:flutter_ui/model/menu.dart';
import 'package:flutter_ui/ui/widgets/about_tile.dart';
import 'package:flutter_ui/ui/widgets/profile_tile.dart';
import 'package:flutter_ui/utils/uidata.dart';

class HomePage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  late Size deviceSize;
  late BuildContext _context;
  //menuStack
  Widget menuStack(BuildContext context, Menu menu) => InkWell(
        onTap: () => _showModalBottomSheet(context, menu),
        splashColor: Colors.orange,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              menuImage(menu),
              menuColor(),
              menuData(menu),
            ],
          ),
        ),
      );

  //stack 1/3
  Widget menuImage(Menu menu) => Image.asset(
        menu.image,
        fit: BoxFit.cover,
      );

  //stack 2/3
  Widget menuColor() => Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 5.0,
          ),
        ]),
      );

  //stack 3/3
  Widget menuData(Menu menu) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            menu.icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            menu.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      );

  //appbar
  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: UIData.kitGradients)),
          ),
          title: const Row(
            children: <Widget>[
              FlutterLogo(
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(UIData.appName)
            ],
          ),
        ),
      );

  //bodygrid
  Widget bodyGrid(List<Menu> menu) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(_context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return menuStack(context, menu[index]);
        }, childCount: menu.length),
      );

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Scaffold(key: _scaffoldState, body: bodySliverList()),
      );

  Widget bodySliverList() {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
      stream: menuBloc.menuItems,
      initialData: const [], // Inicializar con una lista vacía para evitar problemas
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra un indicador de carga mientras esperas los datos
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // Maneja errores
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Si hay datos, muestra la interfaz de usuario
          return CustomScrollView(
            slivers: <Widget>[
              appBar(),
              bodyGrid(snapshot
                  .data!), // Asegúrate de usar `snapshot.data!` ya que sabemos que no es nulo
            ],
          );
        } else {
          // Si no hay datos, muestra un mensaje
          return const Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients2)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(UIData.pkImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "Pawan Kumar",
                  subtitle: "mtechviral@gmail.com",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  void _showModalBottomSheet(BuildContext context, Menu menu) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                header(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: menu.items.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListTile(
                          title: Text(
                            menu.items[i],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, "/${menu.items[i]}");
                          }),
                    ),
                  ),
                ),
                const MyAboutTile()
              ],
            )));
  }

  Widget iosCardBottom(Menu menu, BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        menu.image,
                      ))),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              menu.title,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 20.0,
            ),
            FittedBox(
              child: CupertinoButton(
                onPressed: () => _showModalBottomSheet(context, menu),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                child: const Text(
                  "Go",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
              ),
            )
          ],
        ),
      );

  Widget menuIOS(Menu menu, BuildContext context) {
    return Container(
      height: deviceSize.height / 2,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3.0,
        margin: const EdgeInsets.all(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            menuImage(menu),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                menu.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: Container(
                width: double.infinity,
                color: menu.menuColor,
                child: iosCardBottom(menu, context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyDataIOS(List<Menu> data, BuildContext context) => SliverList(
        delegate: SliverChildListDelegate(
            data.map((menu) => menuIOS(menu, context)).toList()),
      );

  Widget homeBodyIOS(BuildContext context) {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<Menu>>(
      stream:
          menuBloc.menuItems, // Asegúrate de que este flujo emita List<Menu>
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No hay menús disponibles."));
        }
        return CustomScrollView(
          slivers: <Widget>[
            appBar(),
            bodyGrid(snapshot.data!), // Accede a los datos con snapshot.data!
          ],
        );
      },
    );
  }

  Widget homeIOS(BuildContext context) => Theme(
        data: ThemeData(
          fontFamily: '.SF Pro Text',
        ).copyWith(canvasColor: Colors.transparent),
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: <Widget>[
              const CupertinoSliverNavigationBar(
                border: Border(bottom: BorderSide.none),
                backgroundColor: CupertinoColors.white,
                largeTitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(UIData.appName),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: CupertinoColors.black,
                        child: FlutterLogo(
                          size: 15.0,
                          textColor: Colors.yellow,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              homeBodyIOS(context)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? homeIOS(context)
        : homeScaffold(context);
  }
}
