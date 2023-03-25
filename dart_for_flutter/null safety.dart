void main(){

   int? age; // nullable
  print(age == null); // true

  String? answer;
  String? result = answer; // answer or error

  // Late init
  RabinTest rabs = RabinTest('big size');
  rabs.goBig();

}

class RabinTest {
  late String _size;

  RabinTest(this._size);

  void goBig(){
    _size = this._size;
    print(_size);
  }
}