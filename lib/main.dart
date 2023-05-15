import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary_switch_listview/pages/home_page.dart';
import 'package:temporary_switch_listview/providers/pets_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PetsProvider>(
      create: (context) => PetsProvider(),
      child: MaterialApp(
        title: "Provider API Call",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
