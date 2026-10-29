import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];
  bool isLoading = true;
  String error = "";

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse("http://10.0.2.2:8000/api.php"))
          .timeout(const Duration(seconds: 10));

      debugPrint("Status: ${response.statusCode}");
      debugPrint("Body: ${response.body}");

      if (response.statusCode == 200) {
        setState(() {
          items = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception("Server error");
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PHP API")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
          ? Center(child: Text(error))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(items[index]['name']),
              trailing: Text(
                "₹${items[index]['price']}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
