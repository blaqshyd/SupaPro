import 'dart:convert';

import 'package:firepro/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> users = [];

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('API call'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                subtitle: Text(
                  user["gender"],
                  style: const TextStyle(color: Colors.black),
                ),
                title: Text(
                  user['email'],
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUser() async {
    var uri = Uri.parse(apiUrl);
    final res = await http.get(uri);
    final jsonRes = jsonDecode(res.body);
    setState(() {
      users = jsonRes["results"];
    });
  }
}
