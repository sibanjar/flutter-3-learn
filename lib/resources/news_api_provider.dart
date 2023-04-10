import 'dart:convert';
import 'package:flutter_learn_377/model/item_model.dart';
import 'package:http/http.dart' show Client;

const _root_url = 'hacker-news.firebaseio.com';

class NewsApiProvider{

  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final url = Uri.https(_root_url, '/v0/topstories.json');
    final response = await client.get(url);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async{
    final url = Uri.https(_root_url, '/v0/item/$id.json');
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}