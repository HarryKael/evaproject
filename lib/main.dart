import 'package:evaproject/src/app.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConst();
  runApp(const MyApp());
}