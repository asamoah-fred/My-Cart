// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_cart/providers/settings_providers.dart';
import 'package:my_cart/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        ChangeNotifierProvider(
          create: (BuildContext context) => SettingsProvider(),
      //ADD Provider
          child:
        MaterialApp(
      title: 'My Cart',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ),
    );
  }
}
