
import 'dart:convert';

class PostApi1 {
  String getYouTubePosts(){
    return '''
    [
      {
        "title":"Automatic code generation for flutter",
        "description":"Generate automatically"
      },
      {
        "title":"Twitter Clone with flutter",
        "description":"Clone"
      }
    ]
    ''';
  }
}

// the fields are different
class PostApi2 {
  String getMediumPosts(){
    return '''
    [
      {
        "header":"Automatic code generation for flutter",
        "bio":"Generate automatically"
      },
      {
      "header":"Twitter Clone with flutter",
      "bio":"Clone"
      }
    ]
    ''';
  }
}

abstract class IPostApi {
  List<Post> getPosts();
}

class Post{
  final String title;
  final String bio;
  Post({
    required this.title,
    required this.bio,
});
}

// PostApi1 and PostApi2 have different fields name
// Adapter -> follows single responsibility
// Can also merge two apis in ui but using adapter is good.
class PostApi1Adapter implements IPostApi {
  final api = PostApi1();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getYouTubePosts()) as List;
    return data.map((e) => Post(title: e['title'],bio: e['description'])).toList();
  }
}
class PostApi2Adapter implements IPostApi {
  final api = PostApi2();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getMediumPosts()) as List;
    return data.map((e) => Post(title: e['header'],bio: e['bio'])).toList();
  }
}

class PostApi implements IPostApi {
  final api1 = PostApi1Adapter();
  final api2 = PostApi2Adapter();
  // add Posts from another api
  @override
  List<Post> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }

}