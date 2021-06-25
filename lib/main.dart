import 'package:flutter/material.dart';
import 'package:flutter_http_reqres/user_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import 'api_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  final ApiService service = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: jobController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String job = jobController.text;

          final UserModel? user = await service.createUser(name, job);

          print(user!.name);
          print(user!.job);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
