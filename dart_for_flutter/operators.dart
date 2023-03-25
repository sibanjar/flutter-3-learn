
void main(){
  // Logic
  print(1 == 1);
  print(1 < 2);
  print((1 >=2) || ('a' == 'b'));

  int x = 1;
  x++;
  print(x);


  // Assignment
  String? name;
  name ??= 'Guest'; // assign value if null else use current value.

  // String name2 = name ?? 'Guest2';


  // Cascade
  dynamic Paint;
  var paint = Paint();
  paint.color = 'black';
  paint.strokeCap = 'round';
  paint.strokeWidth = 5.0;
  print(paint);

  var paint2 = Paint()
    ..color = 'black'
    ..strokeCap = 'round'
    ..strokeWidth = 5.0;

  // Typecast
  var number = 23 as String;
  // number is String // true

}
