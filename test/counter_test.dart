import 'package:flutter_learn_377/test_for_counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Counter counter;
  // Pre test
  setUp((){
    // setup -> test -> setup -> test -> setup -> test
    counter = Counter();
  });

  // setUpAll(() => null);
  // setupAll -> test -> test -> test
  
  group('Counter Class - ', () {

    test('given counter class when it is init then value of count should be 0', (){
      final val = counter.count;  // Act (when)
      expect(val, 0); // Assert
    });

    test('given counter class when it is incremented then the value should be 1', (){
      counter.increment(); // Act (when)
      expect(counter.count, 1); // Assert
    });

    // Must be independent of each other
    test('given counter class when it is decremented then the value should be -1', (){
      counter.decrement(); // Act (when)
      expect(counter.count, -1); // Assert
    });

    test('given counter class when it is reset then the value should be 0', (){
      counter.increment();
      counter.reset(); // Act (when)
      expect(counter.count, 0); // Assert
    });
  });

  // Post test
  // tearDown(() => null);
  // tearDownAll(() => null);

  // test -> tearDown -> test -> tearDown -> test -> tearDown
  // test -> test -> test -> tearDownAll

}