import 'package:flutter/material.dart';
import 'package:flutter_learn_377/screens/expense_tracker/widgets/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final Iterable<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String,Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var tx in recentTransactions){
        if(tx.date.day == weekDay.day &&
        tx.date.month == weekDay.month &&
        tx.date.year == weekDay.year){
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0,1),
        'amount':totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + (item['amount'] as double) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildList()
        ),
    );
  }

  buildList() {
    List<Widget> list = <Widget>[];

    for (var data in groupedTransactionValues) {
      { //chartBars list with info
    list.add(Flexible(
      fit: FlexFit.loose,
      child: ChartBar(
          data['day'].toString(),
          data['amount'] as double,
          totalSpending == 0.0 ? 0.0:
          (data['amount'] as double) / totalSpending),
    ));
    }
    }
    return list;
  }
}
