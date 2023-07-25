import 'package:flutter_learn_377/test_for_user_api/user_model.dart';
import 'package:flutter_learn_377/test_for_user_api/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp((){
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group('User Repository - ', () {

    group('getUser function', () {
      
      test('given user repository class when getUser function is called and status is 200 then a userModel should be returned ',
          () async {
            // Arrange
            when(()=> mockHTTPClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),)
            .thenAnswer((invocation)async{
              return Response(
              '''
              {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
                "street": "Kulas Light",
                "suite": "Apt. 556",
                "city": "Gwenborough",
                "zipcode": "92998-3874",
                "geo": {
                  "lat": "-37.3159",
                  "lng": "81.1496"
                }
              },
              "phone": "1-770-736-8031 x56442",
              "website": "hildegard.org",
              "company": {
                "name": "Romaguera-Crona",
                "catchPhrase": "Multi-layered client-server neural-net",
                "bs": "harness real-time e-markets"
              }
            }
              ''', 200);
            });
            // Act
            final user = await userRepository.getUser();
            // Assert
            expect(user, isA<User>());
          }
      );

      test('given user repository class when getUser function is called and status is not 200 then a error should throw ',
              () async {
            // Arrange
                when(()=> mockHTTPClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),)
                    .thenAnswer((invocation)async{
                  return Response('{}', 500);
                });
            // Act
            final user = userRepository.getUser();
            // Assert
            expect(user, throwsException);
          }
      );
    });

  });
}