import 'package:flutter/material.dart';
import 'package:flutter_learn_377/feedback/questionExpansion.dart';

import 'frequentlyasked.dart';
import 'logo.dart';

class FeedBackHome extends StatelessWidget {


  const FeedBackHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> questions=[
    'When will i get married?',
    'When will i get rich?',
    'which business is good for me?',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(title: Text('Feedback'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 20,right: 15,left: 15),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Logo(),
                SizedBox(height: 8,),
                FrequentQuestions(questions: questions,),
                SizedBox(height: 8,),
                QuestionExpansion(ques: questions,),
                SizedBox(height: 8,),
                Container(
                  height: 108,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,style: BorderStyle.solid,color: Color(0xFFF0F1F3)),
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFFCFCFF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Ask free to our supporter to support you',style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                          onPressed: () {  },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF00658e),
                            minimumSize: const Size(double.infinity, 36),
                          ),
                          child: const Center(
                              child: Text('Contact',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500,),)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            const ExpansionTile(
              textColor: Colors.white,
              collapsedBackgroundColor: Colors.green,
              backgroundColor: Colors.red,
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: false,
              title: Text(
                'question[index]',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
              ),
              children: <Widget>[
                SizedBox(
                  height: 10,
                )
          ]),
                // FrequentQuestions1(questions: questions,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
