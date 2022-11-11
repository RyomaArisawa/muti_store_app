import 'package:flutter/material.dart';
import 'package:multi_store_app/main_screens/supolier_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const CustomerHomeScreen(),
      home: const SupplierHomeScreen(),
    );
  }
}
