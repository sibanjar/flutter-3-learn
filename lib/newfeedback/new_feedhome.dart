  import 'package:flutter/material.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  class NewFeedbackHone extends StatefulWidget {
    const NewFeedbackHone({super.key});

  @override
  State<NewFeedbackHone> createState() => _NewFeedbackHoneState();
}

class _NewFeedbackHoneState extends State<NewFeedbackHone> {
  bool isSmileColored = false;
  bool isUnhappyColored = false;
  bool isSmileCircleColored = false;
  bool isunhappyCircleColored = false;


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('New feedback page')),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Feedback',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    TextButton(onPressed: () { },
                    child: const Text('close',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xFFb4b8bb)),)),
                  ],
                ),
              ),
              buildFeedbackBody(context),

            ],
          ),
        ),
      );
    }

    Widget buildFeedbackBody(BuildContext context){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              children: [
                const Text('How was PocketPandit?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                const Text('We would like your feedback to improve our app',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 16,),
                const Text('How was your experience?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0,vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                        setState(() {
                        isSmileColored = !isSmileColored;
                        isSmileCircleColored = !isSmileCircleColored; // Toggle the color
                        });},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSmileCircleColored ? Colors.yellow : Colors.blueGrey.shade50, // Color of the circle
                              ),
                            ),
                            SvgPicture.asset('assets/images/001-smile.svg',height: 80,width: 80,),
                          ]
                        ),
                      ),
                      InkWell(
                        onTap: (){
                            setState(() {
                              isSmileColored = !isSmileColored;
                              isunhappyCircleColored = !isunhappyCircleColored; // Toggle the color
                            });
                        },
                          child: Stack(
                            alignment: Alignment.center,
                              children:[
                            SvgPicture.asset('assets/images/014-unhappy.svg',height: 80,width: 80,),
                            Container(
                              height: 68,
                              width: 68,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isunhappyCircleColored ? Colors.red.shade500.withOpacity(0.7) : Color(0x00000000),
                                ),
                            ),
                      ] ),),
                    ],
                  ),
                ),
                Text('How likely recommend PocketPandit to others?',style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 16,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40)
                  ),
                    onPressed: (){},
                    child:  const Text('How you like our app',),
                )
              ],
            ),
          ),
        ),
      );
    }
}
