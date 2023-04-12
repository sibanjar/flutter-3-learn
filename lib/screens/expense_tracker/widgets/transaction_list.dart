import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;
  // transaction is parameter passed.
  const TransactionList(this.transactions,this._deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (context,index){
            return buildListTile(context,index);
            return buildCard(index);
          },
    );
  }

  buildListTile(BuildContext context,int index){
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                child: Text('\$${transactions[index].amount}'),
              ),
            ),
        ),title: Text(transactions[index].title,style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
        trailing: IconButton(
          icon: Icon(Icons.delete,color: Theme.of(context).primaryColor,),
          onPressed: () {
            _deleteTransaction(transactions[index].id);
          },),
      ),
    );
  }

  buildCard(int index){
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text('\$${transactions[index].amount}'),
          ),
          Column(
            children: <Widget>[
              Text(transactions[index].title),
              Text(DateFormat.yMMMd().format(transactions[index].date)),
            ],
          )
        ],
      ),
    );
  }
}
