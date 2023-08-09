void main(){
  final list = [1,2,3];
  final [a,b,c] = list;
  print('$a $b $c');

  final list1 = [1,2,3,4,5,6,7,8];
  final [x,_,z,...g] = list1;
  print('$x $z $g');

  final jsoned = {
    "userId":'1',
    "id":8,
    "title":"lorem ipsun"
  };
  final userID = jsoned['title'];
  print(userID);

  // final {'userId':userId,'id':id,'title':title} = jsoned;
  if(jsoned case {'userId': String userId,'id': int id,'title': String title}){
    print('$userId $id $title');
  }else{
    print('Incorrect json');
  }

  switch(jsoned){
    case {'userId': String userId,'id': int id,'title': String title}:
      print(userId);
      // break is optional in dart 3 if statement is not empty;
    default:
      print('Invalid json');
  }

  // in class
  final human = Human('Nice man',4);
  final Human(:name,:age) = human;
  // final Human(:age,:name) = human; // both works
  final Human(age:agee,name:nameee)  = human;
  print('in class $name');

}

class Human {
  final String name;
  final int age;
  Human(this.name,this.age);
}