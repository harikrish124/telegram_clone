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
    Map<String, dynamic> response = await a1.getdata();

    if (response.containsKey('results')) {
      List<dynamic> newData = response['results'];
      setState(() {
        data = newData;
      });
      print("fetch completed");
    } else {
      print("Error in API response");
    }
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
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final fname = data[index]['name']['first'];
            final lname = data[index]['name']['last'];
            final name = '$fname $lname';

            final image = data[index]['picture']['thumbnail'];
            // Assuming your data is a list of strings, you can display them like this
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
              title: Text(name),
              subtitle: Text(name),
            );
          },
        ),
      ),
    );
  }
}
