import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPctOfTotal;

  const ChartBar(this.label,this.spending,this.spendingPctOfTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return LayoutBuilder(builder: (ctx,constrains){
      return Column(
        children: <Widget>[
          Text('\$${spending.toStringAsFixed(0)}'),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(
            height: constrains.maxHeight * (isPortrait?0.5:0.8),
            width: 10.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey,width:1.0),
                      color: const Color.fromRGBO(220, 220, 220,1),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 4.0,),
          Text(label),
        ],
      );
    });
  }
}
