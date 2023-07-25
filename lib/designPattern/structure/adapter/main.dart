import 'package:flutter/material.dart';
import 'package:flutter_learn_377/designPattern/structure/adapter/adapter.dart';

void main(){
  runApp(
      const FactoryMethodApp()
  );
}

class FactoryMethodApp extends StatelessWidget {
  const FactoryMethodApp ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Adapter',
        home: MyFactoryHomePage()
    );
  }
}

class MyFactoryHomePage extends StatelessWidget {
  const MyFactoryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostApi postApi = PostApi();
    return Scaffold(
        appBar: AppBar(title: const Text('Adapter'),),
        body: ListView.builder(
          itemCount: postApi.getPosts().length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(postApi.getPosts()[index].title),
                subtitle: Text(postApi.getPosts()[index].bio),
              );
            }
        )
    );
  }
}
