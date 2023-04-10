class UserFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String isAdmin = 'isAdmin';

  static List<String> getFields() => [id,name,email,isAdmin];
}

class User{
 final int? id;
 final String name;
 final String email;
 final bool isAdmin;

 const User({
   this.id, required this.name, required this.email, required this.isAdmin,
});

}