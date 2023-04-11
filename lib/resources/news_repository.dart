import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../model/item_model.dart';


class NewsRepository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
    // add the third option if top two don't provide data
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider
  ];

  Future<List<int>>? fetchTopIds(){
    // Iterate over sources when dbProvider
    return sources[1].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id)async{
    ItemModel? item;
    Source source;

    // get data from chronological provider
    for (source in sources){
      item = await source.fetchItem(id);
      if (item !=null){
        break;
      }
    }
    // backup items in all caches
    for (var cache in caches){
      cache.addItem(item!);
    }

    return item;
  }
}

abstract class Source{
  Future<List<int>>? fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache{
  addItem(ItemModel item);
}