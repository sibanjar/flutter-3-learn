import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    // use column spacebetween property instead of stack
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF0F1F3),
        image: const DecorationImage(
          image: AssetImage('assets/images/Group.png'),
        )
      ),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0,right: 15,left: 15,top: 15),
              child: Stack(
                children:[

                   Padding(
                     padding: const EdgeInsets.only(top: 16.0),
                     child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                           height: 24,
                          width: constraints.maxWidth,
                          // color: Colors.purple,
                          child: const Center(child: Text('Whats Your FeedBack?',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)))
                      ),
                  ),
                   ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF00658e),
                          minimumSize: const Size(double.infinity, 36),
                        ),
                        // height:constraints.maxHeight*0.15 ,
                        // width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15),
                        //   color: Colors.tealAccent,
                        //   // image: Image.asset('assets/images/logo.png',fit: BoxFit.fill,);
                        // ),
                        child: const Center(child: Text('Give FeedBack',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500))),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment(0.95,-1.05),
                    child: SizedBox(
                      height: 12,
                      width: 12,
                      child: Icon(Icons.close)
                      ,
                    ),
                  ),
                ]
              ),
            );}
      ),
    );
  }
}
