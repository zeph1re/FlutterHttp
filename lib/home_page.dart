import 'package:flutter/material.dart';
import 'package:flutter_http_request/services/post_result_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostResult postResult = PostResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text((postResult.id == null)
                ? "Nothing to Show"
                : "${postResult.id} | ${postResult.name} | ${postResult.job}"),
            ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("Bandung", "IT Developer")
                      .then((value) {
                    setState(() {
                      postResult = value;
                    });
                  });
                },
                child: const Text("POST"))
          ],
        ),
      ),
    );
  }
}
