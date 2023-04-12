import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_377/screens/expense_tracker/widgets/chart.dart';
import 'package:flutter_learn_377/screens/expense_tracker/widgets/new_transaction.dart';
import 'package:flutter_learn_377/screens/expense_tracker/widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'package:flutter/cupertino.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 2.00, date: DateTime.now().subtract(const Duration(days: 1))),
    Transaction(id: 't2', title: 'Apple', amount: 3.00, date: DateTime.now()),
    Transaction(id: 't3', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't4', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't5', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't6', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't7', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't8', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't9', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't10', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't11', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't12', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't13', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't14', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't15', title: 'Ball', amount: 4.00, date: DateTime.now()),
    Transaction(id: 't16', title: 'Ball', amount: 4.00, date: DateTime.now()),
  ];

  Iterable<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
              const Duration(days: 7),
          ),
      );
    });
  }

  void _addNewTransaction(String title, double amount,DateTime date){
    final newTransaction = Transaction(
        id: Random.secure().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: ctx,
        builder: (bCtx){
          return GestureDetector(
              onTap: (){},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addNewTransaction));
        }
    );
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((element){
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final iosAppBar = CupertinoNavigationBar(
      middle: const Text('Expense Tracker'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>startAddNewTransaction(context),
            child: const Icon(CupertinoIcons.add),
          )
        ],
      ),
    );
    final appBar  = AppBar(
      title: const Text('Expense Tracker'),
      actions: [
        IconButton(
            onPressed: ()=>startAddNewTransaction(context),
            icon: const Icon(Icons.add))
      ],
    );

    final appBody = SafeArea(child: isPortrait?
    SizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.20,
              child: Chart(_recentTransactions)),
          SizedBox(height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.80,
              child: TransactionList(_userTransactions,_deleteTransaction))
        ],
      ),
    ):Row(
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width*0.5,
            child: Chart(_recentTransactions)),
        SizedBox(width: MediaQuery.of(context).size.width*0.5,
            child: TransactionList(_userTransactions,_deleteTransaction))
      ],
    ) );


    return Platform.isIOS?
    CupertinoPageScaffold(
        navigationBar: iosAppBar,
        child: appBody,
    ) :
    Scaffold(
      appBar: appBar,
      body: appBody,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Platform.isIOS? Container() :FloatingActionButton(
        onPressed: ()=>startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
