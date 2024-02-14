import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          backgroundColor: Colors.blue[600],
          title: Text(
            "Telegram",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
