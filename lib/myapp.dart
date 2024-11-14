import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ui/ui/page/dashboard/dashboard_one.page.dart';
import 'package:flutter_ui/ui/page/dashboard/dashboard_two_page.dart';
import 'package:flutter_ui/ui/page/home_page.dart';
import 'package:flutter_ui/ui/page/login/login_page.dart';
import 'package:flutter_ui/ui/page/login/login_two_page.dart';
import 'package:flutter_ui/ui/page/payment/credit_card_page.dart';
import 'package:flutter_ui/ui/page/payment/payment_success_page.dart';
import 'package:flutter_ui/ui/page/profile/profile_one_page.dart';
import 'package:flutter_ui/ui/page/profile/profile_two_page.dart';
import 'package:flutter_ui/ui/page/settings/settings_one_page.dart';
import 'package:flutter_ui/ui/page/shopping/product_detail_page.dart';
import 'package:flutter_ui/ui/page/shopping/shopping_details_page.dart';
import 'package:flutter_ui/ui/page/shopping/shopping_one_page.dart';
import 'package:flutter_ui/ui/page/timeline/timeline_one_page.dart';
import 'package:flutter_ui/ui/page/timeline/timeline_two_page.dart';
import 'package:flutter_ui/utils/translations.dart';
import 'package:flutter_ui/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ui/page/notfound/notfound_page.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: const [
        TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.profileOneRoute: (BuildContext context) => ProfileOnePage(),
        UIData.profileTwoRoute: (BuildContext context) => ProfileTwoPage(),
        UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),
        UIData.timelineTwoRoute: (BuildContext context) => TimelineTwoPage(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.settingsOneRoute: (BuildContext context) => SettingsOnePage(),
        UIData.shoppingOneRoute: (BuildContext context) => ShoppingOnePage(),
        UIData.shoppingTwoRoute: (BuildContext context) =>
            ShoppingDetailsPage(),
        UIData.shoppingThreeRoute: (BuildContext context) =>
            ProductDetailPage(),
        UIData.loginOneRoute: (BuildContext context) => LoginPage(),
        UIData.loginTwoRoute: (BuildContext context) => LoginTwoPage(),
        UIData.paymentOneRoute: (BuildContext context) => CreditCardPage(),
        UIData.paymentTwoRoute: (BuildContext context) => PaymentSuccessPage(),
        UIData.dashboardOneRoute: (BuildContext context) => DashboardOnePage(),
        UIData.dashboardTwoRoute: (BuildContext context) => DashboardTwoPage(),
      },
      onUnknownRoute: (RouteSettings rs) => MaterialPageRoute(
          builder: (context) => NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
