// Records are real values.
// Records can be stored in variables;
// Records can be passed to and from function and store them in list.

void main(){
  // final values = giveSomeDoubles();
  // final values = giveDoubleString();
  // print(values[0]); // we don't know the data types at compile type
  // print(values[1]);

  // Records
  // final values = giveSomeData();
  // print(values.$1);
  // print(values.$2);

  // Records using patterns
  // final (point,greating) = giveSomeData();
  // print(' $point $greating');

  // Records using named values
  final values = giveSomeData();
  print(' ${values.point} ${values.greating}');


  const records = (3.4,'Hi',isAdult:true, 3);
  // records = (3.4,true,'hi',3); // Records are type safe // cannot change order of types
  print(' ${records.$1} ${records.isAdult}');
  // Records are immutable (only have getters)
  // $1 $2 are getters

  // Nullable Records
  (double,int)? name = (4.2,100);
  name = null;
  print(name);

  // Records equality
  ({int x,int y,int z}) age = (x:1,y:2,z:9);
  ({int a,int y,int z}) age1 = (a:1,y:2,z:9);
  ({int x,int y,int z}) age2 = (x:1,y:2,z:9);
  // age = age1; //
  age = age2;

  // Swap in records
  var (aa,bb) = ('yes','no');
  print((aa,bb));
  (aa,bb) = (bb,aa);
  print((aa,bb));

  //
  List<String> listItems = ['hi','man'];
  switch(listItems){
    case ['hi','man']:
      print('dude!');
  }

  int index = 2;
  switch(listItems){
    case ['HI' || 'hi','man'] when index == 2:
      print('dude!');
    default:
      print('bruh');
  }

  // New switch cases
  int page = 1;
  // can return widget if multiple condition
  final text = switch(page){
    0 => 'CLick me',
    1 => 'click here',
    _ => 'None'
  };
  print(text);

}


List<double> giveSomeDoubles() => [5.5,3.3];
List<dynamic> giveDoubleString() => [5.5,'Hey']; // don't know what returns
// The solution may be create a class and return an object. -> verbose solution

// Records
// (double,String) giveSomeData() => (4.3,'3,3');
// Records Named values
({double point,String greating}) giveSomeData() => (point: 4.3,greating:'hey');