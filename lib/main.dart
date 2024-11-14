import 'package:flutter/material.dart';
import 'package:flutter_ui/di/dependency_injection.dart';
import 'package:flutter_ui/myapp.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Injector.configure(Flavor.MOCK);
  runApp(MyApp());
}
