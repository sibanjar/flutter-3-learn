void main(){

  SuperHuman s = SuperHuman('superman');
  s.benchPress();
  s.sprint();
  s.getName();
}

class Human{
  late String name;

  Human(this.name);

  void getName(){
    print(name);
  }
}

class SuperHuman extends Human with Strong,Fast{

  SuperHuman(String name) : super(name);
}

mixin Strong {
  bool doesLift = true;
  void benchPress(){
    print('doing bench press.....');
  }
}

mixin Fast {
  bool doesRun = true;
  void sprint(){
    print('running fast......');
  }
}