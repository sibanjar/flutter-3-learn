import 'package:flutter/material.dart';

class FrequentQuestions extends StatelessWidget {
  // take list of questions string
  final List<String> questions;
   const FrequentQuestions({super.key,required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFf0f1f3),
      ),
      child: Column(
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Text('Frequently Asked Questions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
               TextButton(
                   onPressed: () {
                     print(1);
                   },
                   child: const Text('view all',style: TextStyle(fontSize: 12,color: Color(0xFF6B7376))))
             ],
           ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: Container(
              decoration:  BoxDecoration(
                    border: Border.all(
                      width: 0.1, color: Colors.black,
                    ),
              borderRadius: BorderRadius.circular(5)),
                child: Questions(question: questions)),
          ),
          SizedBox(height: 16,)
        ],
      ),
    );
  }
}

class Questions extends StatelessWidget {
  final List<String> question;
  const Questions( {super.key, required this.question });

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   // shape:  Border.all(width: 1,color: const Color(0xFF000000)),
    //   shape: const Border(
    //    bottom: BorderSide(
    //      style: BorderStyle.solid,
    //      width: 1,
    //      color: Colors.black,
    //    )
    //   ),
    //   contentPadding:EdgeInsets.all(-15),
    //    title: Text(question,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
    // );

  return ListView.builder(
      scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: question.length,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(question[0], style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
                  const Icon(Icons.arrow_forward_ios, size: 12,color: Color(0xFF6B7376),),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.1,
            )
          ],
        ),
      );
    }
    );

  }
}
