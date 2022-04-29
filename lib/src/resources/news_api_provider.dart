import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:performant_data/src/resources/repository.dart';
import '../models/item_model.dart';
import 'dart:async';
import 'repository.dart';

const _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    // refactored code was Uri.parse('$_root/topstories.json') using Uri.https
    final response = await client.get(Uri.parse('$_root/topstories.json'));
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    // refactored code was Uri.parse('$_root/item/$id.json') using Uri.https
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
