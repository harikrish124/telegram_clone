import 'package:flutter/material.dart';
import 'package:telegram_clone/api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Api a1 = Api();
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> newData = await a1.getdata();
    setState(() {
      data = newData;
    });
  }

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
