import 'dart:async';

class Cake{}

class Order{
  String type;
  Order(this.type);
}

void main(){
  final controller = StreamController();

  final orderChocolate = Order('chocolate');
  final orderBanana = Order('banana');

  final baker = StreamTransformer.fromHandlers(
      handleData: (cakeType, sink){ // type property from stream.map
        if(cakeType == 'chocolate'){
          sink.add(Cake());
        }else{
          sink.addError('I cannot bake that cakeType...');
        }
      }
  );

  controller.sink.add(orderChocolate); // order taker
  controller.sink.add(orderBanana); // order taker

  controller.stream // stream is made ahead of time.
      .map((order)=>order.type) // order inspector
      .transform(baker) // baker
      .listen(
          (cake)=> print('Heres your cake $cake'),
      onError:(err)=>print(err)
  );

}