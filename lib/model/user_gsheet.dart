class UserFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String email = 'email';
  static final String isAdmin = 'isAdmin';

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