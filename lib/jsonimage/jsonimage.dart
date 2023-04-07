import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/image_model.dart';
import 'image_list.dart';

class JsonImage extends StatefulWidget {
  const JsonImage({Key? key}) : super(key: key);

  @override
  State<JsonImage> createState() => _JsonImageState();
}

class _JsonImageState extends State<JsonImage> {

  int counter = 0;
  List<ImageModel> images = [];

  Future<void> fetchImage() async {
    counter++;
    final url = Uri.https('jsonplaceholder.typicode.com', '/photos/$counter');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var imageModel = ImageModel.fromJson(json.decode(response.body));
      setState(() {
        images.add(imageModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json Image'),
      ),
      body: Center(
        child: ImageList(images),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
