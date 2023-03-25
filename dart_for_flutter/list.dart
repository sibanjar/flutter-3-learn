void main() {
  List<int> list = [1, 2, 3, 4, 5];
  print(list.sublist(2, 4));
  print(list.length);
  print(list.first);
  print(list.last);
  list.add(6); // push
  list.removeLast(); // pop
  list.insert(1, 1);
  print(list);

  List list2 = List.filled(10, 'hellow');
  print(list2);

  for (int i in list) {
    print(i * 2);
  }

  list.forEach((e) => print(e));

  Iterable<int> doubled = list.map((e) => e * 2);
  print(doubled);

  print('-------------------------------');
  // spread operator
  List<int> combined = [...list,...doubled];
  // print(combined);
  combined.forEach(print);


  bool depressed = false;
  List<String> cart =  [
    'milk',
    'eggs',
    if(depressed) 'Vodka'
  ];
  print(cart);
}
