import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_377/screens/expense_tracker/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  const NewTransaction(this.addTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {

    void submitTransaction(){
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);

      if(enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate == null){
       return;
      }
      // widget only available in stateful
      // widget is special property that gives access to the context of your Widget
      widget.addTransaction(enteredTitle,enteredAmount,_selectedDate);
      // close bottom sheet
      Navigator.of(context).pop();
    }

    void presentDatePicker(){
      showDatePicker(
          context: context,
          initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime.now()
      ).then((value){
        if(value == null){
          return;
        }
        setState(() {
          _selectedDate = value;
        });
      });
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(MediaQuery.of(context).viewInsets.bottom.toString()),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_)=>submitTransaction(),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                onSubmitted: (_)=>submitTransaction(),
              ),
              Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_selectedDate == null ?'No Date Chosen!' : DateFormat.yMd().format(_selectedDate!)),
                  TextButton(
                    onPressed: presentDatePicker,
                    child: const Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              AdaptiveFlatButton('Add', submitTransaction)
            ],
          ),
        ),
      ),
    );
  }
}
