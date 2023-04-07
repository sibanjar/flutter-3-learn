import 'package:flutter/material.dart';
import '../model/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context,int index){
          return buildImage(images[index]);
      }
    );
  }

  Widget buildImage(ImageModel image){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color:Colors.grey ),
    ),
    padding:const EdgeInsets.all(10.0),
    margin:const EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Image.network(image.url),
        ),
        Text(image.title)
      ],
    )
  );
  }
}
