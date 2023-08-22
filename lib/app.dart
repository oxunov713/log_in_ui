import 'package:flutter/material.dart';
import 'package:log_in_ui/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Azizbek Oxunov",
      theme: ThemeData(
        fontFamily: "Jost",
      ),
      home: HomePage(),
    );
  }
}
