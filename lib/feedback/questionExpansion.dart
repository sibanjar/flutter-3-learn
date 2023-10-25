import 'package:flutter/material.dart';

class QuestionExpansion extends StatelessWidget {
 final List<String> ques;
  const QuestionExpansion({super.key, required this.ques});

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
              const Text('dropdown Asked Questions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              TextButton(
                  onPressed: () {
                    print(1);
                  },
                  child: const Text('view all',style: TextStyle(fontSize: 12,color: Color(0xFF6B7376))))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
            child: Container(
                decoration:  BoxDecoration(
                    border: Border.all(
                      width: 0.1, color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Questions(question: ques)),
          ),
          SizedBox(height: 16,)
        ],
      ),
    );

  }
}

class Questions extends StatelessWidget {
  final List<String> question;
  const Questions({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    String description='This is Expansion tile. It is the example of exapnsion tile.';
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: question.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ExpansionTile(
              tilePadding: EdgeInsets.only(left: 8,top: 0),
              textColor: Colors.white,
              title: Text(question[index], style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400,height: 0.7),),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  selectedColor: Colors.green,
                  title: Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            const Divider(
              height: 0,
              thickness: 0.1,
            )
          ],
        );
      },
    );
  }
}
