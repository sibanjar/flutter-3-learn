import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_learn_377/screens/widgets/cat.dart';

class CatAnimation extends StatefulWidget {
  const CatAnimation({Key? key}) : super(key: key);

  @override
  State<CatAnimation> createState() => _CatAnimationState();
}

class _CatAnimationState extends State<CatAnimation> with TickerProviderStateMixin {

  late Animation<double> catAnimation;
  late AnimationController catController;

  // we can also crate two animation for both left and right flap
  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    catAnimation = Tween(begin: -40.0,end: -85.0).animate(
        CurvedAnimation(parent: catController, curve: Curves.easeIn)
    );

    boxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    boxAnimation = Tween(begin: pi*0.6,end: pi*0.65).animate( // radian value
      CurvedAnimation(parent: boxController, curve: Curves.easeInOut)
    );

    boxAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
       // boxController.repeat();
      boxController.reverse();
      }else if(status == AnimationStatus.dismissed){
        boxController.forward();
      }
    });
    boxController.forward();

    // start animation
    // catController.forward();
  }

  onTap(){
    if(catController.status == AnimationStatus.completed){
      catController.reverse();
      boxController.forward();
    }else if(catController.status == AnimationStatus.dismissed){
      catController.forward();
      boxController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Animation'),
      ),
      body: GestureDetector(
          onTap: onTap ,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          )),
    );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(
        // every time a builder is called, a new TextField instance and return it.
        animation: catAnimation,
        builder: (context,child){
          return Positioned(
            // recreating the container again and again but not Cat.
            top: catAnimation.value,
            right: 0.0,
            left: 0.0,
            child: Container(
              child: child,
            ),
          );
    },
    child: const Cat(),
      // now we only have to create Cat on time and then that single instance of cat is going to be reused again.
    );
  }

  Widget buildBox(){
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap(){
    return Positioned(
      top: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context,child){
          return Transform.rotate(
              angle: boxAnimation.value,
              alignment: Alignment.topLeft  ,// otherwise center
              child: child,
            );
        },
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
      ),
    );
  }

  Widget buildRightFlap(){
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context,child){
          return Transform.rotate(
              angle: -boxAnimation.value,
              alignment: Alignment.topRight  ,// otherwise center
              child: child,
            );
        },
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
      ),
    );
  }
}
