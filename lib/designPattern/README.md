# Factory methods is to define an interface for creating an object, but we let subclasses decide which class to instantiate.
* this is creation design pattern. (concerned with the way of creating objects. Object creation mechanism.)
    - factory method
    - abstract factory
      - It is a way to provide an interface for creating families of related or depended objects without specifying their concrete classes.
      - It is a superset of factory method
      - Alternate to Facade pattern.
      - Also be implemented as Singleton / cause we want abstract class to have one instance only.
    - singleton
      - It ensures that a class has only one instance and provides a global point of access to it.
      - Ensures that a class has only 1 instance.
      - Use case
        - Only 1 instance of database
        - socket
        - eg: FirebaseAuth.instance.
    - prototype
      - To specify the kinds of objects to create using a prototypical instance and create new object copying that prototype.
      - It is cloning.
    - builder
      - https://namanrivaan.medium.com/builder-pattern-in-dart-flutter-why-is-builder-pattern-not-used-anymore-610a133e344c

* Structural
- Adapter
- composite
- proxy
- fly weight
- facade
- bridge
- decorator

* Behavioural
- Template Method
- Mediator
- Chain of responsibility
- observer
- command
- state
- visitor
- iterator
- interpreter
- memento